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
  version = "1.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AqgrCjo2slUzCdeMZeHA4zULZA/kCR9T9m9YKxH0k3g=";
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
