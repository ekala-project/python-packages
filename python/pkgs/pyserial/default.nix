{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyserial";
  version = "3.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-PHfgFBcN//vYFub/wgXphC77EL6fWOwW0+hnW0klzds=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "serial" ];

  meta = {
    homepage = "https://github.com/pyserial/pyserial";
    description = "Python serial port extension";
    license = lib.licenses.bsd3;
  };
})
