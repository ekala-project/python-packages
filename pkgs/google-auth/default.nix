{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cachetools,
  cryptography,
  pyasn1-modules,
  rsa,
}:

buildPythonPackage rec {
  pname = "google-auth";
  version = "2.50.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "google-cloud-python";
    tag = "google-auth-v${version}";
    hash = "sha256-Z3TsDEtDDfXO23gOlmEM5O4a9qS2+fTB7g0vJ4dOFH4=";
  };

  sourceRoot = "${src.name}/packages/google-auth";

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "cachetools" ];

  dependencies = [
    cachetools
    cryptography
    pyasn1-modules
    rsa
  ];

  pythonImportsCheck = [
    "google.auth"
    "google.oauth2"
  ];

  meta = {
    description = "Google Auth Python Library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-auth";
    license = lib.licenses.asl20;
  };
}
