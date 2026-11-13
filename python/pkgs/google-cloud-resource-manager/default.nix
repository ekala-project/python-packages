{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  google-cloud-core,
  grpc-google-iam-v1,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-resource-manager";
  version = "1.19.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_resource_manager";
    inherit (finalAttrs) version;
    hash = "sha256-aOXSjtkJGrGt8Ep3h2sJ1VPpekQPungWP2zitf5fJVg=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    google-cloud-core
    grpc-google-iam-v1
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.resourcemanager"
    "google.cloud.resourcemanager_v3"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Resource Manager API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-resource-manager";
    license = lib.licenses.asl20;
  };
})
