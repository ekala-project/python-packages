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
  version = "4.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "globus";
    repo = "globus-sdk-python";
    tag = version;
    hash = "sha256-q3fYU8/r6IfoC55iN83jAGdFrhnXx7bTtvuf0R4RBv4=";
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
