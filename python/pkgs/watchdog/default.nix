{
  lib,
  buildPythonPackage,
  fetchPypi,
  pyyaml,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "watchdog";
  version = "7.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-04YeJVQW9JoThEdMsu+gl94WX7Mw1MVDLOZwi1Ce2SI=";
  };

  build-system = [ setuptools ];

  optional-dependencies.watchmedo = [ pyyaml ];

  pythonImportsCheck = [ "watchdog" ];

  meta = {
    description = "Python API and shell utilities to monitor file system events";
    mainProgram = "watchmedo";
    homepage = "https://github.com/gorakhargosh/watchdog";
    license = lib.licenses.asl20;
  };
})
