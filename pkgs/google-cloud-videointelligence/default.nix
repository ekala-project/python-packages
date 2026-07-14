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
  pname = "google-cloud-videointelligence";
  version = "2.19.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_videointelligence";
    inherit version;
    hash = "sha256-ezIMGKBHWwjd6bYKD7/fiRUyDCCWYVn62AtVlAidVh4=";
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
    "google.cloud.videointelligence"
    "google.cloud.videointelligence_v1"
    "google.cloud.videointelligence_v1beta2"
    "google.cloud.videointelligence_v1p1beta1"
    "google.cloud.videointelligence_v1p2beta1"
    "google.cloud.videointelligence_v1p3beta1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Video Intelligence API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-videointelligence";
    license = lib.licenses.asl20;
  };
}
