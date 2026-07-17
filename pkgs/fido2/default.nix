{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  cryptography,
}:

buildPythonPackage rec {
  pname = "fido2";
  version = "2.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8TefhFhwzH/GTH8HMjw85B6MlsNwVOeeCs1WMLP+xaw=";
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
