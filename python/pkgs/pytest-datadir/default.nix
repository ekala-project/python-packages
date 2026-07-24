{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "pytest-datadir";
  version = "1.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gabrielcnr";
    repo = "pytest-datadir";
    tag = "v${version}";
    hash = "sha256-ttzYFzePPpFY6DfMGLVImZMiehuR9IhmIFxBlgrDDmk=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];
  pythonImportsCheck = [ "pytest_datadir" ];

  meta = {
    description = "Pytest plugin for manipulating test data directories and files";
    homepage = "https://github.com/gabrielcnr/pytest-datadir";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
