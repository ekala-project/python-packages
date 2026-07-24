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
  pname = "google-cloud-run";
  version = "0.16.1";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_run";
    inherit version;
    hash = "sha256-Vov3/Ouo+ESjm2mFio5kL2zKJ+q3JGxiHZ00HCibEVg=";
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
}
