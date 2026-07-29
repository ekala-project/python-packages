{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cons,
  multipledispatch,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "etuples";
  version = "0.3.10";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pythological";
    repo = "etuples";
    tag = "v${version}";
    hash = "sha256-h5MLj1z3qZiUXcNIDtUIbV5zeyTzxerbSezFD5Q27n0=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    cons
    multipledispatch
  ];
  pythonImportsCheck = [ "etuples" ];

  meta = {
    description = "Python S-expression emulation using tuple-like objects";
    homepage = "https://github.com/pythological/etuples";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
