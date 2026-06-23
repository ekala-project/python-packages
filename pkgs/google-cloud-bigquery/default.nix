{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  google-api-core,
  google-cloud-bigquery-storage,
  google-cloud-core,
  google-resumable-media,
  grpcio,
  proto-plus,
  protobuf,
  python-dateutil,
  requests,
  pyarrow,
  db-dtypes,
  pandas,
  tqdm,
  ipython,
}:

buildPythonPackage rec {
  pname = "google-cloud-bigquery";
  version = "3.40.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_bigquery";
    inherit version;
    hash = "sha256-s8yxHK8AKfFbKVaVGPZnVT/gj28UWblZAgyD+72PLmg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    google-api-core
    google-cloud-bigquery-storage
    google-cloud-core
    google-resumable-media
    grpcio
    proto-plus
    protobuf
    python-dateutil
    requests
  ]
  ++ google-api-core.optional-dependencies.grpc;

  optional-dependencies = {
    bqstorage = [
      google-cloud-bigquery-storage
      grpcio
      pyarrow
    ];
    pandas = [
      db-dtypes
      pandas
      pyarrow
    ];
    tqdm = [ tqdm ];
    ipython = [ ipython ];
  };

  pythonImportsCheck = [
    "google.cloud.bigquery"
    "google.cloud.bigquery_v2"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google BigQuery API client library";
    homepage = "https://github.com/googleapis/python-bigquery";
    license = lib.licenses.asl20;
  };
}
