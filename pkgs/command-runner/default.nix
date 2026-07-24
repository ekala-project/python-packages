{
  lib,
  buildPythonPackage,
  fetchPypi,
  psutil,
  setuptools,
}:

buildPythonPackage rec {
  pname = "command_runner";
  version = "1.7.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-raJ/6bZOYTxDfw61b064hoipeiNAKQOZ3/yB9kEhDMo=";
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
