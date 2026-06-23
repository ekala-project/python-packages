{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  deprecated,
  google-api-core,
  google-cloud-core,
  grpc-google-iam-v1,
  grpc-interceptor,
  opentelemetry-resourcedetector-gcp,
  proto-plus,
  protobuf,
  sqlparse,
  libcst,
  opentelemetry-api,
  opentelemetry-sdk,
  opentelemetry-semantic-conventions,
  google-cloud-monitoring,
  mmh3,
}:

buildPythonPackage rec {
  pname = "google-cloud-spanner";
  version = "3.63.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "python-spanner";
    tag = "v${version}";
    hash = "sha256-QWBl7X/cKGds617IrHKaIteOnqgwB83jgfi8j/ESUws=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    deprecated
    google-api-core
    google-cloud-core
    grpc-google-iam-v1
    grpc-interceptor
    opentelemetry-resourcedetector-gcp
    proto-plus
    protobuf
    sqlparse
  ];

  optional-dependencies = {
    libcst = [ libcst ];
    tracing = [
      opentelemetry-api
      opentelemetry-sdk
      opentelemetry-semantic-conventions
      google-cloud-monitoring
      mmh3
    ];
  };

  pythonImportsCheck = [
    "google.cloud.spanner_admin_database_v1"
    "google.cloud.spanner_admin_instance_v1"
    "google.cloud.spanner_dbapi"
    "google.cloud.spanner_v1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Cloud Spanner API client library";
    homepage = "https://github.com/googleapis/python-spanner";
    license = lib.licenses.asl20;
  };
}
