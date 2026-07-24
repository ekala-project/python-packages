{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "csscompressor";
  version = "0.9.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-r6IrrbzzEgpPOS5NIvn/9IXARKH+2kqVDsxeup3TGgU=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "csscompressor" ];

  doCheck = false;

  meta = {
    homepage = "https://pypi.org/project/csscompressor/";
    description = "Python port of YUI CSS Compressor";
    license = lib.licenses.bsd3;
  };
}
