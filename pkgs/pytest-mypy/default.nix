{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  attrs,
  mypy,
  pytest,
  filelock,
}:

buildPythonPackage rec {
  pname = "pytest-mypy";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_mypy";
    inherit version;
    hash = "sha256-P1/K/3XIDczGtoz17MKOG75x6VMJRp63oov0CM5VwHQ=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    attrs
    mypy
    pytest
    filelock
  ];

  pythonImportsCheck = [ "pytest_mypy" ];

  meta = {
    description = "Mypy static type checker plugin for Pytest";
    homepage = "https://github.com/dbader/pytest-mypy";
    license = lib.licenses.mit;
  };
}
