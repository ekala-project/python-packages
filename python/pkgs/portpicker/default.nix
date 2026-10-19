{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  psutil,
}:

buildPythonPackage (finalAttrs: {
  pname = "portpicker";
  version = "1.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-vVB/1vlvZe4CeB8uZ06dxsmbv6bjw5mS45FiBMnUMfo=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [ psutil ];

  pythonImportsCheck = [ "portpicker" ];

  meta = {
    homepage = "https://github.com/google/python_portpicker";
    description = "Library to choose unique available network ports";
    license = lib.licenses.asl20;
  };
})
