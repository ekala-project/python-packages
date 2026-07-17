{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  cryptography,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "jwcrypto";
  version = "1.5.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-w9cRS29uZbUva32oF+uMuEI+HaMeHvE1CER8gey9zDQ=";
  };

  build-system = [ hatchling ];

  dependencies = [
    cryptography
    typing-extensions
  ];

  pythonImportsCheck = [ "jwcrypto" ];

  meta = {
    homepage = "https://github.com/latchset/jwcrypto";
    description = "Implementation of JOSE Web standards";
    license = lib.licenses.lgpl3Plus;
  };
}
