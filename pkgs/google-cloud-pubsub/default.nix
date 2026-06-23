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
  version = "2.34.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_pubsub";
    inherit version;
    hash = "sha256-JfmMO6FqaYcfnruteuzj/mPIr+e6OSqtIJS+cw1UWXY=";
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
