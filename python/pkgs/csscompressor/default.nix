{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "csscompressor";
  version = "0.9.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-r6IrrbzzEgpPOS5NIvn/9IXARKH+2kqVDsxeup3TGgU=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "csscompressor" ];

  meta = {
    homepage = "https://pypi.org/project/csscompressor/";
    description = "Python port of YUI CSS Compressor";
    license = lib.licenses.bsd3;
  };
})
