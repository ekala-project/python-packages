{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "xlsx2csv";
  version = "0.8.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-YY/FAmEoYN6KuOPWGV6Z7zMv/8aDN/a4nllpCq0NILU=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "xlsx2csv" ];

  meta = {
    description = "Convert xlsx to csv";
    homepage = "https://github.com/dilshod/xlsx2csv";
    license = lib.licenses.bsd3;
  };
})
