{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "oocsi";
  version = "0.4.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-AgDBsPoi0aQ6uglc7Zl4gxVmeyDCysoef5vZpxgwE/Q=";
  };

  build-system = [ setuptools ];

  # Tests are not shipped

  pythonImportsCheck = [ "oocsi" ];

  meta = {
    description = "OOCSI library for Python";
    homepage = "https://github.com/iddi/oocsi-python";
    license = lib.licenses.mit;
  };
})
