{
  lib,
  buildPythonPackage,
  ddt,
  fetchFromGitHub,
  gitdb,
  pkgs,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "gitpython";
  version = "3.1.55";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gitpython-developers";
    repo = "GitPython";
    tag = finalAttrs.version;
    hash = "sha256-FMm+ZNJYarmlw78A+XwCCnzD6ARg3IlFRirjLMzn5OM=";
  };

  postPatch = ''
    substituteInPlace git/cmd.py \
      --replace 'git_exec_name = "git"' 'git_exec_name = "${pkgs.gitMinimal}/bin/git"'
  '';

  build-system = [ setuptools ];

  dependencies = [
    ddt
    gitdb
    pkgs.gitMinimal
  ];

  # Tests require a git repo
  doCheck = false;

  pythonImportsCheck = [ "git" ];

  meta = {
    description = "Python Git Library";
    homepage = "https://github.com/gitpython-developers/GitPython";
    license = lib.licenses.bsd3;
  };
})
