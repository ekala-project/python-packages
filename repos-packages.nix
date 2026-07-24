{ ... }:
let
  pins = import ./pins.nix;
  lib = import pins.lib;
  nativeOverlay = lib.packageSets.mkAutoCalledPackageDir ./pkgs;
  pythonOverlay = lib.packageSets.mkAutoCalledPackageDir ./python/pkgs;
  pythonOverrides = import ./python-packages.nix;
  pkgsOverlay = import ./top-level.nix;
  pkgs = import pins.core { modules = [ (import ./pkgs-module.nix) ]; };
  mkProjection = overlay: base: lib.fix (self: base // overlay self base);

  # Python packages from overlay
  combinedPythonOverlay = lib.composeManyExtensions [
    pythonOverlay
    pythonOverrides
  ];
  projectedPython = mkProjection combinedPythonOverlay pkgs.python3Packages;
  pythonOverlayKeys = lib.composeManyExtensions [ pythonOverlay pythonOverrides ] (_: _: { }) { };
  pythonPkgs = removeAttrs (builtins.intersectAttrs pythonOverlayKeys projectedPython) [
    "_internalCallByNamePackageFile"
  ];

  # Native packages from overlay
  combinedNativeOverlay = lib.composeManyExtensions [
    nativeOverlay
    pkgsOverlay
  ];
  projectedNative = mkProjection combinedNativeOverlay pkgs;
  nativeOverlayKeys = combinedNativeOverlay (_: _: { }) { };
  nativePkgs = removeAttrs (builtins.intersectAttrs nativeOverlayKeys projectedNative) [
    "_internalCallByNamePackageFile"
  ];
in
pythonPkgs // nativePkgs
