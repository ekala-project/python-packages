{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  cryptography,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "jwcrypto";
  version = "1.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-oeFXDaXC412803XsHSiRok3o6zXuLB/o6Rl477cs/pA=";
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
})
