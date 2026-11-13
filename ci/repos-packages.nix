# Unified list of all derivations contributed by python-packages.
#
# This includes:
#   - Native packages from pkgs/ and top-level.nix
#   - Python packages from python/pkgs/ and ci/python-packages.nix, exposed
#     under the `python3Packages` scope (recursed into by nix-eval-jobs)
#
# Used by ekapkgs-update to enumerate packages for automated updates.
{ ... }:
let
  pins = import ../pins.nix;
  lib = import pins.lib;
  pkgsModule = import ../pkgs-module.nix;
  pkgs = import ../. {
    modules = [ pkgsModule ];
  };
  mkProjection = overlay: base: lib.fix (self: base // overlay self base);

  # --- Native packages (pkgs/ directory + top-level.nix overrides) ---
  nativeOverlay = lib.packageSets.mkAutoCalledPackageDir ../pkgs;
  nativeOverrides = import ../top-level.nix;
  combinedNativeOverlay = lib.composeManyExtensions [
    nativeOverlay
    nativeOverrides
  ];
  projectedNative = mkProjection combinedNativeOverlay pkgs;
  nativeOverlayKeys = combinedNativeOverlay (_: _: { }) { };
  nativePkgs = removeAttrs (builtins.intersectAttrs nativeOverlayKeys projectedNative) [
    "_internalCallByNamePackageFile"
  ];

  # --- Python packages (python/pkgs directory + python-packages.nix overrides) ---
  pythonOverlay = lib.packageSets.mkAutoCalledPackageDir ../python/pkgs;
  pythonOverrides = import ./python-packages.nix;
  combinedPythonOverlay = lib.composeManyExtensions [
    pythonOverlay
    pythonOverrides
  ];
  projectedPython = mkProjection combinedPythonOverlay pkgs.python3Packages;
  pythonOverlayKeys = combinedPythonOverlay (_: _: { }) { };
  pythonPkgs = removeAttrs (builtins.intersectAttrs pythonOverlayKeys projectedPython) [
    "_internalCallByNamePackageFile"
  ];
in
nativePkgs
// {
  python3Packages = pythonPkgs // {
    recurseForDerivations = true;
  };
}
