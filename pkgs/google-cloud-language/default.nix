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
  pname = "google-cloud-language";
  version = "2.20.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_language";
    inherit version;
    hash = "sha256-MoROVi9/Fen4E2GGkTyBhRPh9Aw71oXd1Ew7WyhV3JM=";
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
    "google.cloud.language"
    "google.cloud.language_v1"
    "google.cloud.language_v1beta2"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Natural Language API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-language";
    license = lib.licenses.asl20;
  };
}
