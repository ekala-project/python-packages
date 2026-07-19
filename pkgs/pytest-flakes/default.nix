{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pytest,
  pyflakes,
}:

buildPythonPackage rec {
  pname = "pytest-flakes";
  version = "4.0.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lTE06XIVrjH2h5+9c2jBjUP3Cdwvq1t3d9srsrrDqSQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pytest
    pyflakes
  ];

  pythonImportsCheck = [ "pytest_flakes" ];

  meta = {
    description = "Pytest plugin to check source code with pyflakes";
    homepage = "https://pypi.org/project/pytest-flakes/";
    license = lib.licenses.mit;
  };
}
