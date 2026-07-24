{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cryptography,
  requests,
  pyjwt,
}:

buildPythonPackage rec {
  pname = "globus-sdk";
  version = "4.8.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "globus";
    repo = "globus-sdk-python";
    tag = version;
    hash = "sha256-Yky+f/oG9MhMLlqNl3LotPTYiarh5HT5L7jrCKhORos=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    requests
    pyjwt
  ];

  pythonImportsCheck = [ "globus_sdk" ];

  meta = {
    description = "Interface to Globus REST APIs, including the Transfer API and the Globus Auth API";
    homepage = "https://github.com/globus/globus-sdk-python";
    changelog = "https://github.com/globus/globus-sdk-python/releases/tag/${src.tag}";
    license = lib.licenses.asl20;
  };
}
