{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  cryptography,
}:

buildPythonPackage rec {
  pname = "fido2";
  version = "2.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hXh0KKlMP46vcvD/MK+6mDtVmhsbeVyTMYyBtK1AYsQ=";
  };

  build-system = [ poetry-core ];

  dependencies = [ cryptography ];

  pythonImportsCheck = [ "fido2" ];

  meta = {
    homepage = "https://github.com/Yubico/python-fido2";
    description = "Provides library functionality for FIDO 2.0, including communication with a device over USB";
    license = lib.licenses.bsd2;
  };
}
