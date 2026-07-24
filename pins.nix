{
  core = builtins.fetchGit {
    url = "https://github.com/ekala-project/corepkgs.git";
    rev = "81e84032efee5ab2863aa356fea6a5286547d23b";
  };

  lib = builtins.fetchGit {
    url = "https://github.com/jonringer/nix-lib.git";
    rev = "2c14377c3f3825e2cd5ebf43858ec4aaac5bffde";
  };
}
