---
name: best-practices
description: Review a Python package expression for best-practices compliance. Use when reviewing PRs, auditing existing packages, or writing new ones — checks meta completeness, pyproject conventions, dependency placement, testing strategy, source fetching, and formatting.
---

# Best Practices Review

Review a Python package expression and report violations. Read the package file(s), then check every rule below. Report each finding with the line number and a short explanation.

## Meta Attributes

### Required Fields

Every package must have all three:

| Field | What to check |
|-------|---------------|
| `meta.description` | Present, non-empty, does not repeat the package name verbatim |
| `meta.homepage` | Present, upstream project URL |
| `meta.license` | Present, uses `lib.licenses.*` (not a raw string) |

### Recommended Fields

Flag as "recommended" (not error) if missing:

- `meta.mainProgram` — for packages that install a binary (check `top-level.nix` for `toPythonApplication` usage)

### Forbidden Fields

Flag as error if present:

- `meta.maintainers` — not a recognised key in this repo (except `maintainers = [ ]` which is accepted but unnecessary)
- `meta.teams` — not a recognised key
- `meta.platforms` — omit; inherited automatically from the Python interpreter

## Build System

### pyproject

- `pyproject = true` **must** be set for PEP 517/518 builds. Flag legacy `format = "setuptools"` or `format = "pyproject"` as "prefer `pyproject = true`".
- `format = "wheel"` is acceptable for pre-built wheel packages.
- `format = "other"` is acceptable when the package has a non-standard build process.
- `build-system` **must** be present when `pyproject = true` is set.
- Flag any package lacking both `pyproject` and `format` — it falls back to legacy setuptools implicitly.

### Common Build Backends

Flag if `build-system` uses an unusual or outdated backend:

| Backend | Notes |
|---------|-------|
| `setuptools` | Most common; acceptable |
| `hatchling` | Modern; acceptable |
| `flit-core` | Lightweight; acceptable |
| `poetry-core` | Acceptable; do **not** use `poetry` (the full tool) as a build backend |
| `pdm-backend` | Acceptable |
| `maturin` | For Rust extensions; acceptable |
| `meson-python` | For C/C++ extensions; acceptable |
| `setuptools-scm` | Version management plugin; usually paired with `setuptools` |
| `scikit-build-core` | CMake-based; acceptable |

### CMake (in Python Packages)

- If `cmakeFlags` or `cmakeBuildType` are used alongside Python, `cmake.configurePhaseHook` **must** be in `nativeBuildInputs`.
- Native build tools (cmake, ninja, pkg-config, meson) belong in `nativeBuildInputs`, not `buildInputs`.

## Dependencies

### Attribute Naming

| Attribute | Purpose | Flag if misused |
|-----------|---------|-----------------|
| `build-system` | PEP 517 build backends (setuptools, hatchling, etc.) | — |
| `dependencies` | Runtime Python dependencies | Flag `propagatedBuildInputs` as "prefer `dependencies`" |
| `optional-dependencies` | Extras groups (attrset of lists) | — |
| `nativeBuildInputs` | Build-time tools (compilers, code generators, pkg-config, cmake) | — |
| `buildInputs` | C/C++ libraries linked at build time | — |
| `nativeCheckInputs` | Test-only dependencies | Flag bare `checkInputs` as "prefer `nativeCheckInputs`" |

### Dependency Placement

- **Build tools** (compilers, code generators, pkg-config, cmake, ninja, meson) belong in `nativeBuildInputs`, not `buildInputs`.
- **C/C++ libraries** belong in `buildInputs`, not `nativeBuildInputs`.
- **Test frameworks** (`pytestCheckHook`, `unittestCheckHook`, `pytest-mock`, etc.) belong in `nativeCheckInputs`.
- **Python runtime dependencies** belong in `dependencies`, not `propagatedBuildInputs`.
- `strictDeps = true` should be set when `depsBuildBuild` is used.

### Dependency Relaxation

- `pythonRelaxDeps` is acceptable when upstream pins tighter than necessary — list the specific packages being relaxed.
- `pythonRemoveDeps` is acceptable for removing dependencies unavailable in the package set — prefer this over patching `pyproject.toml` when a simple removal suffices.
- Flag blanket `pythonRelaxDeps = true` (without a package list) as "prefer explicit package list".

## Testing

### Preferred: `testPaths` + `passthru.tests`

The preferred testing strategy uses `testPaths` which auto-generates `passthru.tests.python` and a `test_src` output, decoupling tests from the main build:

```nix
nativeCheckInputs = [ pytestCheckHook ];
testPaths = [ "tests" ];
```

This is **strongly preferred** over in-build testing because:
- Test failures don't invalidate the package or its downstream consumers
- Tests run against the installed package, not the build tree
- Avoids rebuilding the package just to re-run tests

### Acceptable: `pytestCheckHook` without `testPaths`

When `pytestCheckHook` is in `nativeCheckInputs` but `testPaths` is not set, the tests still run but without the `passthru.tests` decoupling. Flag as "recommend adding `testPaths`" when the source tree contains an obvious test directory.

### Acceptable: Manual `passthru.tests`

For complex test setups (e.g., circular dependencies with pytest), a manual `passthru.tests` is acceptable:

```nix
passthru.tests = {
  pytest = callPackage ./tests.nix { };
};
```

### Smoke Checks

- `pythonImportsCheck` is **recommended** for all packages. It provides basic import validation during the build.
- Flag missing `pythonImportsCheck` as a recommendation.

### What to Flag

| Pattern | Severity | Recommendation |
|---------|----------|----------------|
| `pytestCheckHook` without `testPaths` | Recommendation | Add `testPaths = [ "tests" ];` (or appropriate path) |
| `doCheck = true` explicitly | Warning | Remove — enable testing via `testPaths` or `passthru.tests` instead |
| `doCheck = false` explicitly | Warning | Remove — `false` is already the default |
| `doInstallCheck = false` explicitly | Warning | Remove — already the default |
| Custom `checkPhase` with pytest | Recommendation | Prefer `pytestCheckHook` + `testPaths` |
| `disabledTests` without `pytestCheckHook` | Warning | Tests won't actually be disabled without the hook |

### Test Attributes

These attributes are forwarded to the `testPaths` test derivation automatically:
- `disabledTests`, `disabledTestPaths`, `enabledTestPaths`
- `pytestFlags`, `pytestFlagsArray`, `unittestFlagsArray`
- `preCheck`, `postCheck`, `preInstallCheck`, `postInstallCheck`

## Packaging Conventions

### Structural

- Use `finalAttrs` pattern — flag `rec {` as "prefer finalAttrs". The `finalAttrs` pattern enables better overriding and self-reference.
- Do **not** set `__structuredAttrs = true` — it is the default.
- Do **not** set `doCheck = false` or `doInstallCheck = false` — they are defaults.
- Avoid `placeholder` when possible — prefer shell output references for better content-addressed derivation support. E.g., `"PREFIX=${placeholder "out"}"` → `"PREFIX=$(out)"`.
- Directory name **must** match `pname` and use hyphens, not underscores (e.g., `zope-interface`, not `zope_interface`).

### Formatting

- Attributes inside a `buildPythonPackage` block should be separated by an empty line between each attribute.
- Exception: `pname`, `version`, `pyproject`, `format`, and `disabled` may be grouped together without blank lines.

### Function Arguments

- Comment-group function arguments by purpose:

```nix
{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  requests,
  urllib3,
  # tests
  pytestCheckHook,
}:
```

## Sources

### Fetchers

- **`fetchPypi`** is preferred for PyPI sdist tarballs. This repo uses `fetchPypi` (lowercase 'i').
- **`fetchFromGitHub`** is preferred when patches or test fixtures are needed from the repository.
- Flag `fetchurl` or `fetchzip` pointing at a PyPI or GitHub tarball as "prefer `fetchPypi` or `fetchFromGitHub`".
- `fetchFromGitHub`/`fetchFromGitLab` should use `tag`, not `rev` with a tag value.
- Hash should be SRI format (`sha256-...`), not bare hex.

### Version References

When using `finalAttrs`:
```nix
src = fetchFromGitHub {
  tag = "v${finalAttrs.version}";
  ...
};
```

When using `rec`:
```nix
src = fetchPypi {
  inherit pname version;
  ...
};
```

## Python-Specific Patterns

### Version Gating

- Use `disabled = pythonOlder "3.x";` to skip on older interpreters, not conditional `meta.platforms`.
- Import `pythonOlder` or `pythonAtLeast` in the function arguments when needed.

### Namespace Packages

- Use `pythonNamespacesHook` for PEP 420 namespace packages (e.g., `zope.*`, `azure.*`).

### Wheels

- `format = "wheel"` is acceptable for pre-built binary packages.
- Wheel packages should still have `pythonImportsCheck`.
- Avoid wheels when a source build is feasible — source builds are more reproducible.

### Alternate Versions

- Place alternate versions in separate files alongside `default.nix` (e.g., `5.nix`, `3.nix`).
- The `default.nix` should contain the latest/primary version.

### Patching pyproject.toml

When patching `pyproject.toml`, prefer targeted fixes:

```nix
postPatch = ''
  substituteInPlace pyproject.toml \
    --replace-fail "setuptools>=68" "setuptools"
'';
```

Flag broad `sed` replacements that could break unrelated content.

## Commits

- Each commit should be one logical change.
- Commit message format: `python3Packages.<pname>: init at <version>` or `python3Packages.<pname>: <old> -> <new>`.
- Fixup commits should be squashed before merge.
- Do **not** add AI attribution (`Co-Authored-By`) to commits.

## Output Format

Group findings by severity:

```
## Errors
- line 12: `build-system` missing when `pyproject = true` is set
- line 30: `meta.maintainers = [ lib.maintainers.foo ]` is forbidden — remove or use `[ ]`

## Warnings
- line 8: `propagatedBuildInputs` — prefer `dependencies`
- line 25: `doCheck = false` is the default — remove redundant line
- line 40: `__structuredAttrs = true` is the default — remove redundant line
- line 5: `rec {` — prefer `finalAttrs` pattern

## Recommendations
- missing `pythonImportsCheck`
- line 15: `pytestCheckHook` present but no `testPaths` — consider adding `testPaths = [ "tests" ];`
- missing `meta.mainProgram` for CLI package
```

If there are no findings in a severity group, omit that group. If the package is clean, say so.
