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
  version = "1.9.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-LybJmvfDLzw0uRni0U6vGpWRQXbWk/t3aXc/OrC3mZ0=";
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
    maintainers = [ ];
  };
})
