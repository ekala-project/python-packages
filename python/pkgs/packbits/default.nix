{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "packbits";
  version = "0.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-vGs3C7NOBKyM+oNeBsBIQ4Cv/G1ZOtuACd1sD3v/8DQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "packbits" ];

  meta = {
    homepage = "https://github.com/psd-tools/packbits";
    description = "PackBits encoder/decoder for Python";
    license = lib.licenses.mit;
  };
})
