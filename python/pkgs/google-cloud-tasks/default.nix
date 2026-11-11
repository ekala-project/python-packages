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
  pname = "google-cloud-tasks";
  version = "2.26.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_tasks";
    inherit (finalAttrs) version;
    hash = "sha256-3zO+V0EcV715FGHQu81tBLTg5V+cZbaGgnBsrSR8WwY=";
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
    "google.cloud.tasks"
    "google.cloud.tasks_v2"
    "google.cloud.tasks_v2beta2"
    "google.cloud.tasks_v2beta3"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Cloud Tasks API API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-tasks";
    license = lib.licenses.asl20;
  };
})
