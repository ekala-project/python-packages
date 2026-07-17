{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "bech32";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fW24IUYDvXhx/PpsCCbvaLhbCr2Q+iHChanF4h0r2Jk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "bech32" ];

  meta = {
    description = "Reference implementation for Bech32 and segwit addresses";
    homepage = "https://github.com/fiatjaf/bech32";
    license = lib.licenses.mit;
  };
}
