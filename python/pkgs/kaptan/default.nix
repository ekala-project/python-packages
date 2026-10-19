{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "kaptan";
  version = "0.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-EBMwpE/e3oiFhvMBC9FFwOxIpIBrxWQp+lSHpndAIfg=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyyaml ];

  pythonImportsCheck = [ "kaptan" ];

  meta = {
    homepage = "https://kaptan.readthedocs.io/";
    description = "Configuration manager for python applications";
    license = lib.licenses.bsd3;
  };
})
