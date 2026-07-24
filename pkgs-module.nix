{ lib, ... }:

let
  nativeOverlay = lib.packageSets.mkAutoCalledPackageDir ./pkgs;
  pythonOverlay = lib.packageSets.mkAutoCalledPackageDir ./python/pkgs;
  pythonOverrides = import ./python-packages.nix;
  pkgsOverlay = import ./top-level.nix;
in
{
  overlays = {
    pkgs = [
      nativeOverlay
      pkgsOverlay
    ];
    python = [
      pythonOverlay
      pythonOverrides
    ];
  };
}
