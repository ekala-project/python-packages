---
name: fix-builds
description: Fix all broken package builds in the repository. Runs a full build of ci/packages.nix in the background while iterating on failures in the foreground until everything builds.
---

# Fix Broken Builds

This skill orchestrates two parallel build processes to find and fix all broken packages contributed by this repository.

## Strategy

1. **Background build** — runs `nix-build ./ci/packages.nix -A buildable --max-jobs 5 --keep-going` to build everything possible and populate the store with successful builds.
2. **Foreground build loop** — runs `nix-build ./ci/packages.nix -A buildable --max-jobs 1` which stops at the first failure. The agent diagnoses and fixes the failure, commits the fix, then re-runs the build. This repeats until the full build succeeds.

Both commands use `ci/packages.nix -A buildable`, which is scoped to only packages contributed by this repo (native packages from `pkgs/`, Python packages from `python/pkgs/`, and overrides from `ci/python-packages.nix` and `top-level.nix`). Upstream corepkgs packages are excluded.

## Procedure

### Step 1: Launch the background build

Use the Bash tool with `run_in_background: true`:

```bash
nix-build ./ci/packages.nix -A buildable --max-jobs 5 --keep-going 2>&1
```

This warms the store and builds everything it can in parallel. Do not wait for it.

### Step 2: Run the foreground fix loop

Run this command (NOT in background):

```bash
nix-build ./ci/packages.nix -A buildable --max-jobs 1 2>&1
```

Use a generous timeout (600000ms / 10 minutes). When it fails:

1. **Parse the error** — identify which package failed and the failure mode.
2. **Read the build log** — the error output contains the log path (`/nix/store/...-<pkg>.drv`). Run `nix log /nix/store/...-<pkg>.drv` or read the relevant portion of the stderr output to understand the failure.
3. **Classify the failure** — match it to one of the known patterns below.
4. **Read the package source** — find and read the Nix expression for the broken package.
5. **Apply the fix** — edit the Nix expression.
6. **Validate** — run `nix-instantiate -A <package>` then `nix-build -A <package>` to confirm the fix works before re-running the full build.
7. **Commit** — commit the fix following the repo's commit conventions. Do NOT add AI attribution.
8. **Re-run** — go back to running `nix-build ./ci/packages.nix -A buildable --max-jobs 1` and repeat until it succeeds.

### Step 3: Confirm completion

When the foreground build completes successfully (exit code 0), all packages are building. Report the list of packages that were fixed.

## Failure Classification

### Obsolete patches
**Symptom:** "Reversed patch detected" or "Hunk FAILED"
**Fix:** Remove the obsolete `fetchpatch` entry and unused function arguments.

### Python build-system issues
**Symptom:** "Backend subprocess exited", setuptools-scm version errors, Cython mismatch, missing conftest.py
**Fix:** Update `build-system`, patch `pyproject.toml`, use `pythonRemoveDeps`, or fix test file references.

### CMake issues
**Symptom:** CMake install errors, missing build targets, feature flag renames
**Fix:** Add explicit `cmakeFlags` for install dirs or updated option names.

### Compiler errors (-Werror)
**Symptom:** `[-Werror=...]` errors
**Fix:** Add `env.NIX_CFLAGS_COMPILE = "-Wno-error=<specific-warning>";` — never suppress all warnings.

### Hash mismatches (Rust/Go)
**Symptom:** "hash mismatch in fixed-output derivation"
**Fix:** Replace `cargoHash` or `vendorHash` with the correct hash from the error message.

### Dependency failures
**Symptom:** "Build failed due to failed dependency" referencing a different package
**Fix:** Identify and fix the actual broken dependency first, then retry.

### Structured attrs breakage
**Symptom:** Bash errors in phases — unbound variable, bad substitution, word splitting issues
**Fix:** Convert bare `$var` iteration to `"${var[@]}"`, fix array handling, move variables to `env` attrset.

### Missing dependencies
**Symptom:** `attribute '<name>' missing` during evaluation
**Fix:** Port the dependency or disable the feature with a TODO comment.

### Missing build tools
**Symptom:** `Program 'xxx' not found` or `cannot find -lxxx`
**Fix:** Add to `nativeBuildInputs` (build tools) or `buildInputs` (libraries).

## Locating Package Source Files

- Python packages: `python/pkgs/<name>/default.nix`
- Native packages: `pkgs/<name>/default.nix`
- Post-processing overrides: `ci/python-packages.nix`
- Top-level CLI apps: `top-level.nix`

The attribute path in the error maps to directory names — `error in <name>` means `python/pkgs/<name>/default.nix` or `pkgs/<name>/default.nix`.

To find a package file when the location is unclear:

```bash
find pkgs python/pkgs -name default.nix -path "*/<package-name>/*" 2>/dev/null
```

## Commit Conventions

Each fix gets its own commit. Follow the repo conventions:

- `python3Packages.<pkg>: fix build` — for Python package build fixes
- `<pkg>: fix build` — for native package build fixes
- `python3Packages.<pkg>: remove obsolete patch` — for patch removals
- `python3Packages.<pkg>: update cargoHash` / `update vendorHash` — for hash updates

Do NOT add `Co-Authored-By` or any AI attribution to commits.

## Important Notes

- Always read the package source before making changes.
- Always validate individual package fixes before re-running the full build.
- Fix dependency failures bottom-up — fix the leaf dependency first.
- Use `nix log` to read full build logs when the inline error is insufficient.
- Run `nix fmt` on any edited `.nix` files before committing.
- This repo uses `ci/packages.nix -A buildable` which is already scoped to this repo's packages. Do NOT use `ci/repos-packages.nix` for builds (it is for enumeration by update tooling, not building).
