{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "traits";
  version = "7.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-4GLahv9ANEPDcMX3Sy1YuTmNPnWsnXxkuiwGkBqIgTM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "traits" ];

  meta = {
    description = "Explicitly typed attributes for Python";
    homepage = "https://pypi.org/project/traits/";
    license = lib.licenses.bsd3;
  };
})
