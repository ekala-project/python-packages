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
  pname = "google-cloud-dlp";
  version = "3.38.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_dlp";
    inherit version;
    hash = "sha256-BcdlhL62CzBcE9xRMhp9Aebj7DHd8QXxjVDy+DT3toQ=";
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
    "google.cloud.dlp"
    "google.cloud.dlp_v2"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Cloud Data Loss Prevention (DLP) API API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-dlp";
    license = lib.licenses.asl20;
  };
}
