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
  pname = "google-cloud-batch";
  version = "0.22.3";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_batch";
    inherit version;
    hash = "sha256-ULIqB2tIIhFMSFtgCPcjoEvqksosIeI0sK78kYZGz20=";
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
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.batch"
    "google.cloud.batch_v1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Batch API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-batch";
    license = lib.licenses.asl20;
  };
}
