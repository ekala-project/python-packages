{
  lib,
  buildPythonPackage,
  fetchPypi,
  fastavro,
  google-api-core,
  pandas,
  protobuf,
  pyarrow ? null,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-bigquery-storage";
  version = "2.36.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_bigquery_storage";
    inherit version;
    hash = "sha256-08HOnS06TXEWJZiJ3L48fHBQb3H2zmu+VKoKaLu6j48=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  optional-dependencies = {
    fastavro = [ fastavro ];
    pandas = [ pandas ];
    pyarrow = lib.optionals (pyarrow != null) [ pyarrow ];
  };

  pythonImportsCheck = [
    "google.cloud.bigquery_storage"
    "google.cloud.bigquery_storage_v1"
    "google.cloud.bigquery_storage_v1beta2"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "BigQuery Storage API API client library";
    homepage = "https://github.com/googleapis/python-bigquery-storage";
    license = lib.licenses.asl20;
  };
}
