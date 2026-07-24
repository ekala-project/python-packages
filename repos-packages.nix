{ ... }:
let
  pins = import ./pins.nix;
  lib = import pins.lib;
  pythonOverlay = lib.packageSets.mkAutoCalledPackageDir ./pkgs;
  pythonOverrides = import ./python-packages.nix;
  pkgs = import pins.core { modules = [ (import ./pkgs-module.nix) ]; };
  mkProjection = overlay: base: lib.fix (self: base // overlay self base);
  combinedOverlay = lib.composeManyExtensions [ pythonOverlay pythonOverrides ];
  projected = mkProjection combinedOverlay pkgs.python3Packages;
  # Only expose attrs defined by the overlay, not the full base set
  overlayKeys = lib.composeManyExtensions [ pythonOverlay pythonOverrides ] (_: _: { }) { };
in
  removeAttrs (builtins.intersectAttrs overlayKeys projected) [ "_internalCallByNamePackageFile" ]
