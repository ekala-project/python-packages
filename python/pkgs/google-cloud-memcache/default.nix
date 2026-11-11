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
  pname = "google-cloud-memcache";
  version = "1.17.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_memcache";
    inherit (finalAttrs) version;
    hash = "sha256-vzRTatUt79/yEKYa91KFLRN8yWQJUsQjELNCpC4PuZE=";
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
})
