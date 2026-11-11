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

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-run";
  version = "0.16.2";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_run";
    inherit (finalAttrs) version;
    hash = "sha256-SA7N6JsY3JmqxFhASPZHfoVgAq9Neo56briUgB0BGQs=";
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
  ];

  pythonImportsCheck = [ "google.cloud.run" ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Run API client library";
    homepage = "https://pypi.org/project/google-cloud-run/";
    license = lib.licenses.asl20;
  };
})
