{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rjsmin";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-fC71fVXi122wwND3OZxsXv3plcZ3sZC6MPuUAZ+UoH4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "rjsmin" ];

  meta = {
    homepage = "http://opensource.perlig.de/rjsmin/";
    description = "Module to minify Javascript";
    license = lib.licenses.asl20;
  };
})
