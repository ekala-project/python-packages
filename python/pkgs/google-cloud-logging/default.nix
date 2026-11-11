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

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-logging";
  version = "3.17.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_logging";
    inherit (finalAttrs) version;
    hash = "sha256-1zQ/K4K0+ekkS/yKunrQNMQV+bu0Be0o0RJao30nC3I=";
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
})
