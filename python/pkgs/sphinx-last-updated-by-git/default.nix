{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  sphinx,
  gitpython,
  gitMinimal,
}:
buildPythonPackage (finalAttrs: {
  pname = "sphinx-last-updated-by-git";
  version = "0.3.8-unstable-2026-03-22";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mgeier";
    repo = "sphinx-last-updated-by-git";
    rev = "8d4eef2561996319e6f785b4faa914a1e6545476";
    hash = "sha256-30pZiqWs6Da+O8j08EIHrUoiJfJUPT6FdDiPBjmvRL8=";
    fetchSubmodules = true;
    leaveDotGit = true;
  };

  build-system = [ setuptools ];

  dependencies = [
    sphinx
    gitpython
  ];

  postPatch = ''
    # we cant just substitute by matching `'git'` due to collisons
    substituteInPlace src/sphinx_last_updated_by_git.py \
      --replace-fail "'git', 'ls-tree'" " '${lib.getExe gitMinimal}', 'ls-tree'" \
      --replace-fail "'git', 'log'" "'${lib.getExe gitMinimal}', 'log'" \
      --replace-fail "'git', 'rev-parse'" "'${lib.getExe gitMinimal}', 'rev-parse'"
  '';

  propagatedBuildInputs = [ gitMinimal ];

  meta = {
    description = "Get the last updated time for each Sphinx page from Git";
    homepage = "https://github.com/mgeier/sphinx-last-updated-by-git";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
})
