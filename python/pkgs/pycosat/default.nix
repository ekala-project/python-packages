{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pycosat";
  version = "0.6.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-o3bPriCxb8++8kvzwEeoopTDUDK7BR+piELBK7q28P8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pycosat" ];

  meta = {
    description = "Bindings to picosat SAT solver";
    homepage = "https://github.com/ContinuumIO/pycosat";
    license = lib.licenses.mit;
  };
})
