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
  pname = "google-cloud-dataproc-metastore";
  version = "1.23.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_dataproc_metastore";
    inherit version;
    hash = "sha256-J1iZ6gE3q3KZPSg81SqEqdSPDEhR6wtliZgvLU09rU0=";
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
    "google.cloud.metastore"
    "google.cloud.metastore_v1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Dataproc Metastore API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-dataproc-metastore";
    license = lib.licenses.asl20;
  };
}
