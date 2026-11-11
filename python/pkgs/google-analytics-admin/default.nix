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

buildPythonPackage (finalAttrs: {
  pname = "google-analytics-admin";
  version = "0.30.2";
  pyproject = true;

  src = fetchPypi {
    pname = "google_analytics_admin";
    inherit (finalAttrs) version;
    hash = "sha256-TB87JDh1J6InVlWf8djyLEEuVuBRLfL4ryx7gF9hlKk=";
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
    "google.analytics.admin"
    "google.analytics.admin_v1alpha"
  ];

  pythonNamespaces = [ "google.analytics" ];

  meta = {
    description = "Google Analytics Admin API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-analytics-admin";
    license = lib.licenses.asl20;
  };
})
