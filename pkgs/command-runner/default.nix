{
  lib,
  buildPythonPackage,
  fetchPypi,
  psutil,
  setuptools,
}:

buildPythonPackage rec {
  pname = "command_runner";
  version = "1.7.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Vq7OjOYnTW3gDT5IccXalqR7vYv7rhjQdUGZd8hawfU=";
  };

  build-system = [ setuptools ];

  dependencies = [ psutil ];

  pythonImportsCheck = [ "command_runner" ];

  meta = {
    description = "Platform agnostic command execution with live output capture and UAC/sudo elevation";
    homepage = "https://github.com/netinvent/command_runner";
    license = lib.licenses.bsd3;
  };
}
