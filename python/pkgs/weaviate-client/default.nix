{
  lib,
  authlib,
  buildPythonPackage,
  deprecation,
  fastapi,
  fetchFromGitHub,
  flask,
  grpcio-health-checking,
  grpcio-tools,
  grpcio,
  h5py,
  httpx,
  litestar,
  numpy,
  pandas,
  polars,
  pydantic,
  pythonOlder,
  requests,
  stdenv,
  setuptools-scm,
  validators,
}:

buildPythonPackage rec {
  pname = "weaviate-client";
  version = "4.22.0";
  pyproject = true;

  disabled = pythonOlder "3.12";

  src = fetchFromGitHub {
    owner = "weaviate";
    repo = "weaviate-python-client";
    tag = "v${version}";
    hash = "sha256-dAN4R71BQsYJkxdwnDvLEkw1rfJvxRX6IUVsh3+WWEE=";
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
    deprecation
    fastapi
    flask
    grpcio
    grpcio-health-checking
    grpcio-tools
    h5py
    httpx
    litestar
    numpy
    pandas
    polars
    pydantic
    requests
    validators
  ];
  pythonImportsCheck = [ "weaviate" ];

  meta = {
    description = "Python native client for easy interaction with a Weaviate instance";
    homepage = "https://github.com/weaviate/weaviate-python-client";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
