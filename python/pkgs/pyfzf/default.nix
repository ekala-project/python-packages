{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyfzf";
  version = "0.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nk412";
    repo = "pyfzf";
    tag = version;
    hash = "sha256-w+ZjQGFd/lR2TiTHc2uQSJXORmzJJZXsr9BO4PIw/Co=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyfzf" ];

  # Module has no tests

  meta = {
    description = "Wrapper for fzf";
    homepage = "https://github.com/nk412/pyfzf";
    license = lib.licenses.mit;
  };
}
