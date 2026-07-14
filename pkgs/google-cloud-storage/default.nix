{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  google-api-core,
  google-auth,
  google-cloud-core,
  google-crc32c,
  google-resumable-media,
  grpc-google-iam-v1,
  grpcio,
  grpcio-status,
  opentelemetry-api,
  proto-plus,
  protobuf,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-storage";
  version = "3.10.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "python-storage";
    tag = "v${version}";
    hash = "sha256-pKy1A9RNyRlAn4bXclcdvbfW4kZOP9Z4HqKWwcrDePo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    google-api-core
    google-auth
    google-cloud-core
    google-crc32c
    google-resumable-media
    requests
  ];

  optional-dependencies = {
    grpc = [
      google-api-core
      grpc-google-iam-v1
      grpcio
      grpcio-status
      proto-plus
      protobuf
    ] ++ google-api-core.optional-dependencies.grpc;
    protobuf = [ protobuf ];
    tracing = [ opentelemetry-api ];
  };

  pythonImportsCheck = [ "google.cloud.storage" ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Storage API client library";
    homepage = "https://github.com/googleapis/python-storage";
    license = lib.licenses.asl20;
  };
}
