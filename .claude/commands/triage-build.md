# Triage a broken Python package build

You are triaging a broken build for a Python Nix package in this repository. The package name is: $ARGUMENTS

## Step 1: Read the package

Read `python/pkgs/$ARGUMENTS/default.nix`. If it doesn't exist, tell the user.

## Step 2: Attempt to evaluate

Run `nix-instantiate -A python3Packages.$ARGUMENTS` (30s timeout). If it evaluates successfully, move to Step 3. If it fails, analyze the error:

- **"required argument X not found"**: The function argument `X` doesn't exist in the package set. Either it's misspelled, hasn't been packaged, or the dep name differs. Check:
  - `ls python/pkgs/<hyphenated-name>/` for local packages
  - `nix-instantiate -A python3Packages.<name>` for upstream packages
  - If not found, remove the argument and its usage, or note it needs to be packaged.

- **"attribute X in selection path not found"**: Same as above - dependency not available.

- **"infinite recursion encountered"**: Circular dependency. Check if a build-system dep is also in dependencies or vice versa.

Report the evaluation result and fix any evaluation errors before proceeding.

## Step 3: Attempt to build

Run `nix-build -A python3Packages.$ARGUMENTS --keep-going` in background (10min timeout). While waiting, read the build log if it fails.

## Step 4: Diagnose the build failure

Common failure patterns and fixes:

### Missing build backend
**Symptom**: `No module named 'setuptools'` / `No module named 'hatchling'` / `Cannot import build backend`
**Fix**: Add the correct build backend to function args and `build-system = [ ... ]`
- `setuptools.build_meta` -> `setuptools`
- `hatchling.build` -> `hatchling`
- `flit_core.buildapi` -> `flit-core`
- `poetry.core.masonry.api` -> `poetry-core`
- `pdm.backend` -> `pdm-backend`
- `meson-python` -> `meson-python` (also add `meson` to `nativeBuildInputs`)
- `uv_build` -> Cannot fix without newer Rust toolchain. Note this and skip.

### Version constraint mismatch
**Symptom**: `Cython: wanted <X, found Y` / `setuptools: wanted <X, found Y`
**Fix**: Add `pythonRelaxDeps = [ "package-name" ];` to relax the constraint. Or use `substituteInPlace pyproject.toml --replace-fail "package>=X,<Y" "package>=X"` in `postPatch` to remove the upper bound.

### substituteInPlace / substituteStream pattern mismatch
**Symptom**: `substituteStream pattern mismatch in <file>`
**Fix**: The pattern in `--replace-fail` no longer matches the source. Download or inspect the source to find the actual current string, and update the pattern. If the constraint was already removed upstream, delete the `--replace-fail` line entirely.

### Patch failed
**Symptom**: `Patch failed (X/Y hunks)`
**Fix**: Check if the patch is still needed. If it's a `fetchpatch` from upstream, the fix may have been merged. Remove or update the patch. If it's a local `.patch` file, regenerate it against the new source.

### Missing runtime dependency
**Symptom**: `ModuleNotFoundError: No module named 'X'` during pythonImportsCheck
**Fix**: Add the missing module to function args and `dependencies = [ ... ]`. Map PyPI names to Nix attr names (underscores become hyphens).

### Python 3.13 distutils removal
**Symptom**: `No module named 'distutils'`
**Fix**: Add `setuptools` to dependencies (it provides distutils backport), or add a `postPatch` to remove distutils usage:
```nix
postPatch = ''
  substituteInPlace <file> \
    --replace-fail "import distutils" "" \
    --replace-fail "from distutils" "from setuptools._distutils"
'';
```

### Cython compatibility
**Symptom**: Type annotation errors, redeclared variables in Cython compilation
**Fix**: Add `postPatch` to remove problematic type annotations:
```nix
postPatch = ''
  substituteInPlace <file>.pyx \
    --replace-fail "var: type = value" "var = value"
'';
```

### Byte-compilation failures (Python 3.13)
**Symptom**: `compileall` or byte-compilation subprocess failures
**Fix**: Add to postPatch:
```nix
postPatch = ''
  cat > setup.cfg << SETUP_CFG
  [install]
  compile = 0
  optimize = 0
  SETUP_CFG
'';
```

## Step 5: Apply the fix

Make the minimal fix following repo conventions:
- `build-system = [ ... ]` for Python build backends (not nativeBuildInputs)
- `pyproject = true;` for PEP 517 builds
- `meta.maintainers = [ ]` always
- Don't add `doCheck = false` (it's the default)
- Don't add test infrastructure

## Step 6: Verify the fix

Run `nix-instantiate -A python3Packages.$ARGUMENTS` to verify evaluation. If it passes and the fix was a simple metadata/dependency change, report success. For build-system changes, attempt a full build to verify.

## Step 7: Commit

Stage the file and commit with the appropriate message format:
- For fixes at the same version: `python3Packages.<pname>: fix build`
- For version bumps: `python3Packages.<pname>: <old> -> <new>`
