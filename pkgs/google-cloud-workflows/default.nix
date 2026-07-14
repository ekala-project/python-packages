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
  version = "1.22.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_workflows";
    inherit version;
    hash = "sha256-9+uHMI2CPzwNWcn9Kci7ze+Oi5E4MhgHTIMf2Sfr4y0=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    proto-plus
    protobuf
  ] ++ google-api-core.optional-dependencies.grpc;

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
