{
  lib,
  authlib,
  buildPythonPackage,
  fetchFromGitHub,
  grpcio,
  grpcio-health-checking,
  grpcio-tools,
  httpx,
  packaging,
  protobuf,
  pydantic,
  pythonOlder,
  setuptools-scm,
  validators,
}:

buildPythonPackage rec {
  pname = "weaviate-client";
  version = "4.23.1";
  pyproject = true;

  disabled = pythonOlder "3.12";

  src = fetchFromGitHub {
    owner = "weaviate";
    repo = "weaviate-python-client";
    tag = "v${version}";
    hash = "sha256-9vnGApuYJTzTeOufB0/3ONPaMMfgq2t4NxpmqyYDIhg=";
  };

  pythonRelaxDeps = [
    "httpx"
    "validators"
    "authlib"
    "grpcio"
    "protobuf"
  ];

  build-system = [ setuptools-scm ];

  dependencies = [
    authlib
    grpcio
    grpcio-health-checking
    grpcio-tools
    httpx
    packaging
    protobuf
    pydantic
    validators
  ];

  pythonImportsCheck = [ "weaviate" ];

  meta = {
    description = "Python native client for easy interaction with a Weaviate instance";
    homepage = "https://github.com/weaviate/weaviate-python-client";
    license = lib.licenses.mit;
  };
}
