{
  lib,
  asn1crypto,
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "python-pkcs11";
  version = "0.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "danni";
    repo = "python-pkcs11";
    tag = "v${version}";
    sha256 = "sha256-GhBpqVVdN1pD2zjlXxtHACIoP9Bw44rzT+w+sGO7PV0=";
  };

  build-system = [
    cython
    setuptools-scm
  ];

  dependencies = [
    asn1crypto
  ];

  # Test require additional setup
  doCheck = false;

  pythonImportsCheck = [ "pkcs11" ];

  meta = {
    description = "PKCS#11/Cryptoki support for Python";
    homepage = "https://github.com/danni/python-pkcs11";
    license = lib.licenses.mit;
  };
}
