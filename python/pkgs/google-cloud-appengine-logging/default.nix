{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  grpc-google-iam-v1,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-appengine-logging";
  version = "1.11.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_appengine_logging";
    inherit (finalAttrs) version;
    hash = "sha256-zgU3kt+Y/eR5DF8HAXYIjJ6/DlWjfHVMj44Rso3bTXM=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    grpc-google-iam-v1
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.appengine_logging"
    "google.cloud.appengine_logging_v1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Appengine logging client library";
    homepage = "https://github.com/googleapis/python-appengine-logging";
    license = lib.licenses.asl20;
  };
})
