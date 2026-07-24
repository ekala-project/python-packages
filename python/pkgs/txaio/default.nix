{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "txaio";
  version = "26.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-PukAsjMck0V1MP3bzMGjIMTi16yPkHPQHD++h3YsyzU=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "txaio" ];

  meta = {
    description = "Compatibility API for Twisted/asyncio";
    homepage = "https://github.com/crossbario/txaio";
    license = lib.licenses.mit;
  };
}
