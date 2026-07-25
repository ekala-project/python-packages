{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "msgspec";
  version = "0.21.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jcrist";
    repo = "msgspec";
    tag = version;
    # Note that this hash changes after some time after release because they
    # use `$Format:%d$` in msgspec/_version.py, and GitHub produces different
    # tarballs depending on whether tagged commit is the last commit, see
    # https://github.com/NixOS/nixpkgs/issues/84312
    hash = "sha256-mjABnKhZeLLbSQPelZmi+UKZDEIiXi3c9shC8EG6tfE=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];
  # `tests/typing` runs type checkers
  pythonImportsCheck = [ "msgspec" ];

  meta = {
    description = "Module to handle JSON/MessagePack";
    homepage = "https://github.com/jcrist/msgspec";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
