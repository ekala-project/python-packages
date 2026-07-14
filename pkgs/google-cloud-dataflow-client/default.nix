{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  google-auth,
  grpcio,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-dataflow-client";
  version = "0.14.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_dataflow_client";
    inherit version;
    hash = "sha256-luoVCivPdtJs5hgStMkEhQ6nVARIp1y/a8gLT6LCLac=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    google-auth
    grpcio
    proto-plus
    protobuf
  ] ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.dataflow"
    "google.cloud.dataflow_v1beta3"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Dataflow API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-dataflow-client";
    license = lib.licenses.asl20;
  };
}
