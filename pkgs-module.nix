let
  pins = import ./pins.nix;
  lib = import pins.lib;
  pythonOverlay = lib.mkAutoCalledPackageDir ./pkgs;
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
