{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "colorlover";
  version = "0.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-uPtyRqtG4fXmcVZJRTwXYuJFpRXeX/LStKq3puZ/pOI=";
  };

  build-system = [ setuptools ];

  # no tests included in distributed archive

  pythonImportsCheck = [ "colorlover" ];

  meta = {
    description = "Color scales in Python for humans";
    homepage = "https://github.com/plotly/colorlover";
    license = lib.licenses.mit;
  };
})
