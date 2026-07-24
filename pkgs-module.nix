{ lib, ... }:

let
  pythonOverlay = lib.packageSets.mkAutoCalledPackageDir ./pkgs;
  pythonOverrides = import ./python-packages.nix;
  pkgsOverlay = import ./top-level.nix;
in
{
  overlays = {
    pkgs = [ pkgsOverlay ];
    python = [
      pythonOverlay
      pythonOverrides
    ];
  };
}
