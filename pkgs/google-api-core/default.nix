{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  google-auth,
  googleapis-common-protos,
  grpcio,
  grpcio-gcp,
  grpcio-status,
  proto-plus,
  protobuf,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-api-core";
  version = "2.29.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "python-api-core";
    tag = "v${version}";
    hash = "sha256-wqDGtCYAH2f+P3zUfXgiQTePLr7a0qzUTeEc6pdCGio=";
  };

  build-system = [ setuptools ];

  dependencies = [
    googleapis-common-protos
    google-auth
    protobuf
    proto-plus
    requests
  ];

  pythonRelaxDeps = [ "protobuf" ];

  optional-dependencies = {
    async_rest = [ google-auth ] ++ google-auth.optional-dependencies.aiohttp;
    grpc = [
      grpcio
      grpcio-status
    ];
    grpcgcp = [ grpcio-gcp ];
    grpcio-gcp = [ grpcio-gcp ];
  };

  pythonImportsCheck = [ "google.api_core" ];

  meta = {
    description = "Core Library for Google Client Libraries";
    longDescription = ''
      This library is not meant to stand-alone. Instead it defines common
      helpers used by all Google API clients.
    '';
    homepage = "https://github.com/googleapis/python-api-core";
    license = lib.licenses.asl20;
  };
}
