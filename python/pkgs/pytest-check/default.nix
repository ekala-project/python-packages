{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  pytest,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest_check";
  version = "3.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-4qqQtni2ouD0K1/gNAUcmGdFDJmz5hOTBwpOSAwyulc=";
  };

  build-system = [ hatchling ];

  dependencies = [ pytest ];

  pythonImportsCheck = [ "pytest_check" ];

  meta = {
    description = "Pytest plugin allowing multiple failures per test";
    homepage = "https://github.com/okken/pytest-check";
    license = lib.licenses.mit;
  };
})
