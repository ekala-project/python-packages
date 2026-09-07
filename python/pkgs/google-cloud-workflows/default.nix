{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-workflows";
  version = "1.23.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_workflows";
    inherit version;
    hash = "sha256-vo4IpdE0GG2834Z8BbFZrYrH3jtkJbIb76q39PJY1Kg=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.workflows"
    "google.cloud.workflows_v1"
    "google.cloud.workflows_v1beta"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Python Client for Cloud Workflows";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-workflows";
    license = lib.licenses.asl20;
  };
}
