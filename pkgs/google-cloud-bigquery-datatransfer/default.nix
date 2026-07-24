{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  libcst,
  proto-plus,
  protobuf,
  pytz,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-bigquery-datatransfer";
  version = "3.23.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_bigquery_datatransfer";
    inherit version;
    hash = "sha256-LQEAqT9uiaEV1mjU/Cq8DwwiPqCZ9bfHNrzgECumI/k=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    libcst
    proto-plus
    protobuf
    pytz
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.bigquery_datatransfer"
    "google.cloud.bigquery_datatransfer_v1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "BigQuery Data Transfer API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-bigquery-datatransfer";
    license = lib.licenses.asl20;
  };
}
