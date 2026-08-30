{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatch-vcs,
  hatchling,

  # dependencies
  testtools,
}:

buildPythonPackage rec {
  pname = "testscenarios";
  version = "0.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2hhe4xbYdwIb62OV8tgM7SKpnCh2xC1UmU47rTw9r00=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [ testtools ];

  pythonImportsCheck = [ "testscenarios" ];

  meta = {
    description = "Pyunit extension for dependency injection";
    homepage = "https://github.com/testing-cabal/testscenarios";
    license = lib.licenses.asl20;
  };
}
