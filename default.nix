let
  pins = import ./pins.nix;
in

{
  modules ? [ ],
}@args:

let
  filteredAttrs = builtins.removeAttrs args [
    "modules"
  ];
in

import pins.core (
  {
    modules = modules ++ [ ./pkgs-module.nix ];
  }
  // filteredAttrs
)
