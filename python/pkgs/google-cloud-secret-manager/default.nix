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

buildPythonPackage rec {
  pname = "google-cloud-secret-manager";
  version = "2.30.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_secret_manager";
    inherit version;
    hash = "sha256-JuyHc3cxtIP3+VwmqMereeIstmMXyVAG5/aYXbxDyKI=";
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
    "google.cloud.secretmanager"
    "google.cloud.secretmanager_v1"
    "google.cloud.secretmanager_v1beta1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Secret Manager API API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-secret-manager";
    license = lib.licenses.asl20;
  };
}
