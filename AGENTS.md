# Agent Guide for python-packages

This repository is a curated collection of Python (and a few native) packages for a poly-repo Nixpkgs fork built on [ekala-project/corepkgs](https://github.com/ekala-project/corepkgs).

## Repository Layout

| Path | Purpose |
|------|---------|
| [`default.nix`](default.nix) | Entry point; imports pins and applies `pkgs-module.nix` via the corepkgs module system |
| [`pins.nix`](pins.nix) | Pinned Git dependencies (`corepkgs`, `nix-lib`) |
| [`pkgs-module.nix`](pkgs-module.nix) | Module that wires up native and Python overlays via `mkAutoCalledPackageDir` |
| [`python-packages.nix`](python-packages.nix) | Post-processing overlay for aliases and overrides applied after auto-called entries |
| [`top-level.nix`](top-level.nix) | Promotes select Python packages to CLI applications via `toPythonApplication` |
| [`repos-packages.nix`](repos-packages.nix) | Standalone helper that projects overlays onto base packages (useful for validation/testing) |
| [`python/pkgs/`](python/pkgs/) | ~2,500+ auto-discovered Python package expressions |
| [`pkgs/`](pkgs/) | Native (C/C++) package expressions (`qhull`, `xsimd`) |
| [`README.md`](README.md) | Brief project overview |

## How Packages Are Discovered

Packages do **not** need to be registered anywhere. `mkAutoCalledPackageDir` from `nix-lib` automatically discovers and `callPackage`s every `default.nix` found in the `python/pkgs/` and `pkgs/` directories. The directory name becomes the attribute name.

```
python/pkgs/requests/default.nix  -->  python3Packages.requests
pkgs/qhull/default.nix            -->  pkgs.qhull
```

Only add an entry to `python-packages.nix` if a package needs post-processing (aliasing, dependency patching, overrides). Only add to `top-level.nix` if a Python package should be exposed as a top-level CLI binary.

## Adding a Python Package

Create `python/pkgs/<pname>/default.nix` following this pattern:

```nix
{
  lib,
  buildPythonPackage,
  fetchPyPi,  # or fetchFromGitHub
  # build-system
  setuptools,
  # dependencies
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "<package-name>";
  version = "<version>";
  pyproject = true;

  src = fetchPyPi {
    inherit (finalAttrs) pname version;
    hash = "sha256-...";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "<module>" ];

  meta = {
    description = "...";
    homepage = "...";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
```

### Key conventions

- **Directory name = pname.** Use hyphens, not underscores (e.g., `zope-interface`).
- **`pyproject = true;`** for PEP 517/518 builds (the common case).
- **`meta.maintainers = [ ];`** Always set to an empty list.
- **`doCheck = false;`** is already the default; do not set it explicitly.
- **Source fetchers:** prefer `fetchPyPi`; use `fetchFromGitHub` when patches or test fixtures are needed.
- **Alternate versions:** place in a separate file (e.g., `chardet/5.nix`) alongside `default.nix`.
- **Patches:** place `.patch` files alongside `default.nix` in the package directory.

## Commit Message Format

```
python3Packages.<pname>: init at <version>
```

For updates: `python3Packages.<pname>: <version_old> -> <version_new>`

## Validation

```bash
# Evaluate (catches syntax/dependency errors)
nix-instantiate -A python3Packages.<pname>

# Build
nix-build -A python3Packages.<pname>

# Format
nix fmt <path-to-file>
```

For native packages, use the bare attribute name (e.g., `nix-build -A qhull`).

### Checking if a dependency exists

```bash
nix-instantiate -A python3Packages.<dep>  # Python dependency
nix-instantiate -A <dep>                   # Native dependency
```

Do **not** grep `top-level.nix` or `python-packages.nix` -- packages are auto-discovered and may not appear there.

## Current Overrides in python-packages.nix

| Package | Override Reason |
|---------|----------------|
| `rapidfuzz` | Patches replaced for Taskflow 4.1.0 compatibility |
| `lark` | Build-system switched to `setuptools-scm9` (upstream needs >= 9.2.2) |
| `libcst` | Wheel METADATA patched to replace `pyyaml-ft` with `pyyaml` for Python 3.13 |
| `sphinxcontrib-*` (7 pkgs) | `pythonImportsCheck` disabled (docutils missing from runtime closure) |

## CLI Applications (top-level.nix)

These Python packages are exposed as top-level binaries:

`ansi2html`, `exifread`, `ghp-import`, `glad`, `gpxinfo`, `eradicate`, `fastep`, `huey`, `pox`, `rnc2rng`, `scour`, `shortuuid`, `tte`, `wakeonlan`

## External Dependencies

| Pin | Repository | Purpose |
|-----|-----------|---------|
| `core` | [ekala-project/corepkgs](https://github.com/ekala-project/corepkgs) | Base package set and module system |
| `lib` | [jonringer/nix-lib](https://github.com/jonringer/nix-lib) | `mkAutoCalledPackageDir`, `composeManyExtensions`, and other helpers |
