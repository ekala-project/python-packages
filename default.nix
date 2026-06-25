let
  core = builtins.fetchGit {
    url = "https://github.com/ekala-project/corepkgs.git";
    rev = "1b780e9063fbe4d3b3b6014c04ba22030b667491";
  };

  coreRepo = import core;

  lib = import (builtins.fetchGit {
    url = "https://github.com/jonringer/nix-lib.git";
    rev = "c19c816e39d14a60dd368d601aa9b389b09d0bbb";
  });

  pkgsOverlay = lib.mkAutoCalledPackageDir ./pkgs;
  pythonOverrides = import ./python-packages.nix;
  pythonOverlay = lib.composeManyExtensions [
    pkgsOverlay
    pythonOverrides
  ];

  toplevelOverlay = import ./top-level.nix;
in

# Continuation passing style of import
# Values we care to modify are modified, while all other
# arguments are "passed through" to the next scope
{ overlays ? [], config ? { }, ... }@args:

let
  filteredAttrs = builtins.removeAttrs args [ "overlays" "config" ];
in

coreRepo ({
  overlays = [
    toplevelOverlay
  ] ++ overlays;

  config = config // {
    overlays.python = [ pythonOverlay ] ++ (config.overlays.python or [ ]);
  };
} // filteredAttrs)
