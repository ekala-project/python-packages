{
  core = builtins.fetchGit {
    url = "https://github.com/ekala-project/corepkgs.git";
    rev = "81e84032efee5ab2863aa356fea6a5286547d23b";
  };

  lib = builtins.fetchGit {
    url = "https://github.com/jonringer/nix-lib.git";
    rev = "c19c816e39d14a60dd368d601aa9b389b09d0bbb";
  };
}
