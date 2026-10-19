{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "limitlessled";
  version = "1.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "0pd71wxqjvznx10brsj1sgy3420bz7awbzk9jlj422rrdxql754j";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Control LimitlessLED products";
    homepage = "https://github.com/happyleavesaoc/python-limitlessled/";
    license = lib.licenses.mit;
  };
})
