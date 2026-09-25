# Update pins and prune shadowed packages

Update flake inputs, then detect and remove packages in `pkgs/` that are now
provided by corepkgs.

## Step 1: Update flake inputs

```
nix flake update
```

This updates `flake.lock`, and `pins.nix` inherits from it automatically.

## Step 2: Verify evaluation

Run a quick smoke test:

```
nix-instantiate --eval -E 'let pkgs = import ./. {}; in pkgs.python3Packages.requests.name'
```

If this fails, report the error and stop.

## Step 3: Detect shadowed packages

Run the shadowed-packages detection script:

```
nix-instantiate --eval --strict shadowed-packages.nix -A pkgsDir --json
```

Also check for top-level shadows:

```
nix-instantiate --eval --strict shadowed-packages.nix -A topLevel --json
```

## Step 4: Prune shadowed `pkgs/` directories

For each package name returned in the `pkgsDir` list:

1. Verify the directory `pkgs/<name>/` exists.
2. Remove the entire directory: `rm -rf pkgs/<name>`.
3. Validate it still evaluates via corepkgs: `nix-instantiate -A <name>`
4. If evaluation fails, restore it: `git checkout -- pkgs/<name>` and report the failure.

**Do NOT remove any directory without first confirming it appears in the
`pkgsDir` output from step 3.**

## Step 5: Report top-level shadows

If the `topLevel` list is non-empty, print the shadowed names and advise
the user to review `top-level.nix` — these are intentional overrides and
should only be removed after manual review and confirmation.

## Step 6: Summary

Print a summary:
- Pins updated (old rev -> new rev)
- Packages pruned from `pkgs/`
- Any top-level shadows flagged for review
- Any validation failures
