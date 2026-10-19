{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "maxminddb";
  version = "3.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-sZqTjEgVGPGaLFNP/cs7xZWC8Pu9z5+BrJrfkSoK9oY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "maxminddb" ];

  meta = {
    description = "Reader for the MaxMind DB format";
    homepage = "https://github.com/maxmind/MaxMind-DB-Reader-python";
    license = lib.licenses.asl20;
  };
})
