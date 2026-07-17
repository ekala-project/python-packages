{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  py,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-forked";
  version = "1.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Ta/UappgD2XYIrj2BRM+z1s+GUHrs1iOlDtOPrcaWj8=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    py
    pytest
  ];

  pythonImportsCheck = [ "pytest_forked" ];

  meta = {
    description = "Run tests in isolated forked subprocesses";
    homepage = "https://github.com/pytest-dev/pytest-forked";
    license = lib.licenses.mit;
  };
}
