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
  pname = "google-cloud-dataproc-metastore";
  version = "1.24.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_dataproc_metastore";
    inherit (finalAttrs) version;
    hash = "sha256-4d/8dllu4can9WiPiLT67GXyy+RTENOoCOcKw8F761I=";
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
})
