{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  pandas,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-monitoring";
  version = "2.31.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_monitoring";
    inherit version;
    hash = "sha256-tMnTUoyGQ9TrS51ojLs8WRS8X2mzFP98XhtHvcBzqa4=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "protobuf" ];

  dependencies = [
    google-api-core
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  optional-dependencies = {
    pandas = [ pandas ];
  };

  pythonImportsCheck = [
    "google.cloud.monitoring"
    "google.cloud.monitoring_v3"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Stackdriver Monitoring API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-monitoring";
    license = lib.licenses.asl20;
  };
}
