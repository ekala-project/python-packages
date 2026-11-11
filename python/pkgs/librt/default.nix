{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "librt";
  version = "0.16.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-rDjW2NZr89dEFI27wLjhk+GVpR42TtVeIkYx9XIYkfw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [
    "librt"
    "librt.internal"
  ];

  meta = {
    description = "Mypyc runtime library";
    homepage = "https://github.com/mypyc/librt";
    license = lib.licenses.mit;
  };
})
