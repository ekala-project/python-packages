# Switch build backend for a Python package

Switch the build backend for: $ARGUMENTS

The argument format is: `<package-name> <new-backend>`

Where `<new-backend>` is one of: `hatchling`, `flit-core`, `poetry-core`, `pdm-backend`, `meson-python`, `setuptools`

## Step 1: Read the package

Read `python/pkgs/<package-name>/default.nix`.

## Step 2: Identify current backend

Look at the `build-system = [ ... ]` list to find the current build backend.

## Step 3: Apply the switch

1. In the function arguments block at the top, replace the old backend name with the new one.
2. In the `build-system = [ ... ]` list, replace the old backend with the new one.
3. If switching TO `meson-python`, also add `meson` to function args and add `nativeBuildInputs = [ meson ];`.
4. If the old backend had companion packages (e.g., `setuptools-scm` with `setuptools`), remove them unless still needed.
5. Keep any other entries in build-system that aren't part of the old backend (e.g., `cython`, `numpy`).

## Step 4: Handle pyproject.toml patching

If the package source's pyproject.toml references the OLD backend in `[build-system]`, you may need a `postPatch`:

```nix
postPatch = ''
  substituteInPlace pyproject.toml \
    --replace-fail 'requires = ["old-backend"]' 'requires = ["new-backend"]' \
    --replace-fail 'build-backend = "old.module"' 'build-backend = "new.module"'
'';
```

Only add this if the source pyproject.toml won't match the new backend. For packages fetched from PyPI as sdist, the build-system in the Nix expression takes precedence, so patching is usually not needed.

## Step 5: Verify

Run `nix-instantiate -A python3Packages.<package-name>` to verify.

## Step 6: Commit

Commit with: `python3Packages.<package-name>: switch build backend to <new-backend>`
