{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "venusian";
  version = "3.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-U0+zs1VmkoPrOVRYGTHl0dBx/OYdAp1Y8yGaXjpvDEE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "venusian" ];

  meta = {
    description = "Library for deferring decorator actions";
    homepage = "https://pylonsproject.org/";
    license = lib.licenses.bsd0;
  };
})
