{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  pbr,
  setuptools,

  # dependencies
  testtools,
}:

buildPythonPackage rec {
  pname = "testscenarios";
  version = "0.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-wlfLa5Dqfm+P7zFYEh1DBUNBLJqH3zC13ebsi5tXorY=";
  };

  build-system = [
    pbr
    setuptools
  ];

  dependencies = [
    pbr
    testtools
  ];

  doCheck = false;

  pythonImportsCheck = [ "testscenarios" ];

  meta = {
    description = "Pyunit extension for dependency injection";
    homepage = "https://github.com/testing-cabal/testscenarios";
    license = lib.licenses.asl20;
  };
}
