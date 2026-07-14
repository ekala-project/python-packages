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
  pname = "google-cloud-orchestration-airflow";
  version = "1.21.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_orchestration_airflow";
    inherit version;
    hash = "sha256-+AwXsNQlznIXFoS2orE8nJHZ0gtA8cI/JZK54Fvfp8o=";
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
    "google.cloud.orchestration.airflow"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Composer API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-orchestration-airflow";
    license = lib.licenses.asl20;
  };
}
