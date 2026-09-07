{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  grpc-google-iam-v1,
  grpcio-status,
  grpcio,
  libcst,
  opentelemetry-api,
  opentelemetry-sdk,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-pubsub";
  version = "2.40.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_pubsub";
    inherit version;
    hash = "sha256-/n1+t291P2rrzdovTf9TZ0jRmZFH9k2VWlVPVyq7FYU=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "protobuf" ];

  dependencies = [
    google-api-core
    grpc-google-iam-v1
    grpcio
    grpcio-status
    libcst
    opentelemetry-api
    opentelemetry-sdk
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  optional-dependencies = {
    libcst = [ libcst ];
  };

  pythonImportsCheck = [ "google.cloud.pubsub" ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Pub/Sub API client library";
    homepage = "https://github.com/googleapis/python-pubsub";
    license = lib.licenses.asl20;
  };
}
