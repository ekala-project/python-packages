let
  pins = import ./pins.nix;
  lib = import pins.lib;
  pythonOverlay = lib.mkAutoCalledPackageDir ./pkgs;
  pythonOverrides = import ./python-packages.nix;
  pkgs = import pins.core { };
  mkProjection = overlay: pkgs: lib.fix (lib.flip overlay pkgs);
  combinedOverlay = lib.composeManyExtensions [ pythonOverlay pythonOverrides ];
in
  mkProjection combinedOverlay pkgs.python3Packages
