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
  pname = "google-cloud-vision";
  version = "3.14.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_vision";
    inherit version;
    hash = "sha256-Ga9pIYkjNYdmrP1lWtY/RQ0WaxSe6O7KrrOg05DEZ0k=";
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
    "google.cloud.vision"
    "google.cloud.vision_helpers"
    "google.cloud.vision_v1"
    "google.cloud.vision_v1p1beta1"
    "google.cloud.vision_v1p2beta1"
    "google.cloud.vision_v1p3beta1"
    "google.cloud.vision_v1p4beta1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Cloud Vision API API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-vision";
    license = lib.licenses.asl20;
  };
}
