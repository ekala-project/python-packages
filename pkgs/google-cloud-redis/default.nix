{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-redis";
  version = "2.21.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_redis";
    inherit version;
    hash = "sha256-6ulUf+zR5wLWoc5wHGgZ1Rp+bEjNUmdZlIRXx+EkEUI=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.redis"
    "google.cloud.redis_v1"
    "google.cloud.redis_v1beta1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Memorystore for Redis API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-redis";
    license = lib.licenses.asl20;
  };
}
