{
  lib,
  buildPythonPackage,
  fetchPypi,
  pyyaml,
  setuptools,
}:

buildPythonPackage rec {
  pname = "watchdog";
  version = "6.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nd98gv2jro4k3s2hM47eZuHJmIPbk3Edj7lB6qLYwoI=";
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
}
