{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "docopt";
  version = "0.6.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SbOoJSgL1ms6qDWF71nEqMgvLIpSLb51SovI0IyFxJE=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "docopt" ];

  meta = {
    description = "Pythonic argument parser, that will make you smile";
    homepage = "http://docopt.org/";
    license = lib.licenses.mit;
  };
}
