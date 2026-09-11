# Relax dependency bounds for a Python package

Relax overly strict version constraints for: $ARGUMENTS

The argument format is: `<package-name> <dep1> [dep2] [dep3] ...`

Parse the first word as the package name and remaining words as dependencies to relax.

## Step 1: Read the package

Read `python/pkgs/<package-name>/default.nix`.

## Step 2: Check current state

Check if `pythonRelaxDeps` already exists in the file.

## Step 3: Apply the fix

If `pythonRelaxDeps` already exists, add the new dependency names to the existing list.

If `pythonRelaxDeps` doesn't exist, add it after the `build-system` or `dependencies` block:

```nix
pythonRelaxDeps = [ "dep1" "dep2" ];
```

Use the PyPI package names (not Nix attr names) in the list, since `pythonRelaxDeps` matches against wheel metadata.

## Step 4: Verify

Run `nix-instantiate -A python3Packages.<package-name>` to verify evaluation passes.

## Step 5: Commit

Commit with: `python3Packages.<package-name>: relax dependency bounds`
