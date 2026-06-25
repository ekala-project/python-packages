{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  google-auth,
  grpc-google-iam-v1,
  grpcio,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-dataform";
  version = "0.11.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_dataform";
    inherit version;
    hash = "sha256-aopXGBfCJ1UvKN9PbtZ+3WtngDLuB2/Ees/YJfcvgWU=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    google-auth
    grpc-google-iam-v1
    grpcio
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.dataform"
    "google.cloud.dataform_v1beta1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Dataform API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-dataform";
    license = lib.licenses.asl20;
  };
}
