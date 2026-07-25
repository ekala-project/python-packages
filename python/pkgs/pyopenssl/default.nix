{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  openssl,
  setuptools,
  cryptography,
  typing-extensions,
  sphinxHook,
  sphinx-rtd-theme,
}:

buildPythonPackage rec {
  pname = "pyopenssl";
  version = "26.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyca";
    repo = "pyopenssl";
    tag = version;
    hash = "sha256-ASpF7CcakrPS4qg8XFGYgYb7Etjg7wcVyMBbtAZaKO0=";
  };

  outputs = [
    "out"
    "dev"
    "doc"
  ];

  build-system = [ setuptools ];

  nativeBuildInputs = [
    openssl
    sphinxHook
    sphinx-rtd-theme
  ];

  pythonRelaxDeps = [ "cryptography" ];

  dependencies = [
    cryptography
    typing-extensions
  ];
  meta = {
    description = "Python wrapper around the OpenSSL library";
    homepage = "https://github.com/pyca/pyopenssl";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
