{
  lib,
  olefile,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  cryptography,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "msoffcrypto-tool";
  version = "6.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nolze";
    repo = "msoffcrypto-tool";
    tag = "v${finalAttrs.version}";
    hash = "sha256-qhnQXLkEeMfuPl2FJGX19M2B+StlzGU/wHgmRn9jcxc=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    cryptography
    olefile
    setuptools
  ];
  pythonImportsCheck = [ "msoffcrypto" ];

  meta = {
    description = "Python tool and library for decrypting MS Office files with passwords or other keys";
    homepage = "https://github.com/nolze/msoffcrypto-tool";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "msoffcrypto-tool";
  };
})
