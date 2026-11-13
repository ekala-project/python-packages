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

buildPythonPackage (finalAttrs: {
  pname = "pytest-mypy";
  version = "1.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_mypy";
    inherit (finalAttrs) version;
    hash = "sha256-ufQjfAMR7sUHxImG3eLXdvOZyY/bktrlyT+WwZvK4OQ=";
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
})
