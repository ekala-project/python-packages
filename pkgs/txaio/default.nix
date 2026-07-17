{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "txaio";
  version = "25.12.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nyMsIeEqof9SaQ42W1oOz9QswnpuyG4bkuzoj3Y/S3g=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "txaio" ];

  meta = {
    description = "Compatibility API for Twisted/asyncio";
    homepage = "https://github.com/crossbario/txaio";
    license = lib.licenses.mit;
  };
}
