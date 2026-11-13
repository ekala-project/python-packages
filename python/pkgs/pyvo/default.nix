{
  lib,
  buildPythonPackage,
  fetchPypi,
  astropy,
  requests,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyvo";
  version = "1.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-a3AEjRFLjcgnWI5XG6hL67bn621bkSGhfLMHrS/pCB4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    astropy
    requests
  ];

  pythonImportsCheck = [ "pyvo" ];

  meta = {
    description = "Astropy affiliated package for accessing Virtual Observatory data and services";
    homepage = "https://github.com/astropy/pyvo";
    license = lib.licenses.bsd3;
  };
})
