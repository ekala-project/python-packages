{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cbor";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-EyJaJi3fVhXL2f1Vp2oNUwadGLB9Lp8Zw55qy4YJu7Y=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "cbor" ];

  meta = {
    description = "Concise Binary Object Representation (CBOR) library";
    homepage = "https://github.com/brianolson/cbor_py";
    license = lib.licenses.asl20;
  };
}
