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
  pname = "google-cloud-memcache";
  version = "1.16.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_memcache";
    inherit version;
    hash = "sha256-5zs8e/S97VbLYnyO/CKn8P2vdUiSit6X+QTLa/qDfz8=";
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
    "google.cloud.memcache"
    "google.cloud.memcache_v1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Memorystore for Memcached API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-memcache";
    license = lib.licenses.asl20;
  };
}
