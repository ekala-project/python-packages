# Enumerates every package in the repository.
#
# Aliases are disabled. They are shims for a package already covered under its
# canonical name, so evaluating them only repeats work.
#
# When `checkMeta` is enabled, `handleEvalIssue` decides which rejections are bugs.
# `unknown-meta` and `broken-outputs` mean the `meta` itself is malformed, so
# they `abort` and name the package. Everything else -- broken, unfree,
# unsupported, insecure -- is a package correctly refusing to evaluate here,
# and `throw`s.
#
# What is left cannot be caught by `tryEval` and so fails the job with Nix's
# own message and source location: a missing `callPackage` argument, a missing
# attribute, or a type error. Those are the real bugs.
#
# Usage:
#   nix-instantiate --eval --strict ci/eval.nix

{
  checkMeta ? false,
}:

let
  pkgs = import ../. {
    modules = [
      {
        config = {
          inherit checkMeta;
          allowAliases = false;

          handleEvalIssue =
            reason: msg:
            if
              builtins.elem reason [
                "unknown-meta"
                "broken-outputs"
              ]
            then
              abort msg
            else
              throw msg;
        };
      }
    ];
  };

  pins = import ../pins.nix;
  lib = import pins.lib;

  # --- Overlay key extraction (scopes buildable to this repo's packages) ---
  nativeOverlay = lib.packageSets.mkAutoCalledPackageDir ../pkgs;
  nativeOverrides = import ../top-level.nix;
  combinedNativeOverlay = lib.composeManyExtensions [
    nativeOverlay
    nativeOverrides
  ];
  nativeOverlayKeys = combinedNativeOverlay (_: _: { }) { };

  pythonOverlay = lib.packageSets.mkAutoCalledPackageDir ../python/pkgs;
  pythonOverrides = import ./python-packages.nix;
  combinedPythonOverlay = lib.composeManyExtensions [
    pythonOverlay
    pythonOverrides
  ];
  pythonOverlayKeys = combinedPythonOverlay (_: _: { }) { };

  # Forcing `drvPath` resolves every dependency and, for ci/eval.nix, runs
  # `check-meta`. `package` arrives unforced, so a lookup that throws is caught
  # here too.
  probe =
    package:
    let
      value = builtins.tryEval package;
    in
    builtins.tryEval (
      if value.success && pkgs.lib.isDerivation value.value then
        builtins.seq value.value.drvPath null
      else
        null
    );

  # Check whether a value is a derivation whose drvPath can be forced.
  isBuildable =
    value:
    let
      result = builtins.tryEval (pkgs.lib.isDerivation value && builtins.seq value.drvPath true);
    in
    result.success && result.value;

  names = builtins.attrNames pkgs;

  topLevel = map (name: {
    inherit name;
    value = pkgs.${name};
  }) names;

  pythonNames = builtins.attrNames pkgs.python3.pkgs;

  pythonLevel = map (name: {
    inherit name;
    value = pkgs.python3.pkgs.${name};
  }) pythonNames;

  targets = map (pair: pair.value) (topLevel ++ pythonLevel);

  # --- Scoped buildable sets (only this repo's packages) ---
  nativePairs = map (name: {
    inherit name;
    value = pkgs.${name};
  }) (builtins.attrNames nativeOverlayKeys);

  pythonPairs = map (name: {
    inherit name;
    value = pkgs.python3.pkgs.${name};
  }) (builtins.attrNames pythonOverlayKeys);
in
{
  inherit probe targets;

  # Attribute set of all buildable derivations contributed by this repo.
  buildable = builtins.listToAttrs (
    builtins.filter (pair: isBuildable pair.value) (nativePairs ++ pythonPairs)
  );
}
