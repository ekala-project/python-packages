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
  pname = "google-analytics-admin";
  version = "0.30.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_analytics_admin";
    inherit version;
    hash = "sha256-g2c7FmpQEXgcHpBClL2FR5+W7Mf2gUL3zo2BYXdomSU=";
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
    "google.analytics.admin"
    "google.analytics.admin_v1alpha"
  ];

  pythonNamespaces = [ "google.analytics" ];

  meta = {
    description = "Google Analytics Admin API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-analytics-admin";
    license = lib.licenses.asl20;
  };
}
