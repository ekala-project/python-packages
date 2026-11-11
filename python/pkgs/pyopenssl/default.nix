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

buildPythonPackage (finalAttrs: {
  pname = "pyopenssl";
  version = "26.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyca";
    repo = "pyopenssl";
    tag = finalAttrs.version;
    hash = "sha256-ZWlY/dnOs5bDt7VSM6Juyr/I34WHSu2UemvzGmrDfio=";
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
  };
})
