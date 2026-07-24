{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  google-cloud-appengine-logging,
  google-cloud-audit-log,
  google-cloud-core,
  grpc-google-iam-v1,
  opentelemetry-api,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-logging";
  version = "3.16.1";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_logging";
    inherit version;
    hash = "sha256-YDAkrYJX2BlPU8nfryf8LDIRHWJ7xMV0VWWEqBUPys4=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    google-cloud-appengine-logging
    google-cloud-audit-log
    google-cloud-core
    grpc-google-iam-v1
    opentelemetry-api
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.logging"
    "google.cloud.logging_v2"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Stackdriver Logging API client library";
    homepage = "https://github.com/googleapis/python-logging";
    license = lib.licenses.asl20;
  };
}
