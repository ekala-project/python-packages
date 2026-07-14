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
  pname = "google-cloud-os-login";
  version = "2.21.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_os_login";
    inherit version;
    hash = "sha256-0CEaiSDkQVHaupJiHkEELgwq9ee0KLRHctlA3b35m20=";
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
    "google.cloud.oslogin"
    "google.cloud.oslogin_v1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud OS Login API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-os-login";
    license = lib.licenses.asl20;
  };
}
