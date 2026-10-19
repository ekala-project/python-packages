{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "stem";
  version = "1.8.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-g/sZ/9TJ+CIHwAYFFIA4n4CvIhp+R4MACu3sTjhOtYI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "stem" ];

  meta = {
    description = "Controller library that allows applications to interact with Tor";
    homepage = "https://stem.torproject.org/";
    license = lib.licenses.lgpl3Only;
  };
})
