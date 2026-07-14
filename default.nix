let
  pins = import ./pins.nix;
in

# Continuation passing style of import
# Values we care to modify are modified, while all other
# arguments are "passed through" to the next scope
{
  overlays ? [ ],
  config ? { },
  ...
}@args:

let
  filteredAttrs = builtins.removeAttrs args [
    "overlays"
    "config"
  ];
in

import pins.core (
  {
    modules = [ ./pkgs-module.nix ];
    # overlays = [
    #   toplevelOverlay
    # ] ++ overlays;

    # config = config // {
    #   overlays.python = [ pythonOverlay ] ++ (config.overlays.python or [ ]);
    # };
  }
  // filteredAttrs
)
