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
  pname = "google-cloud-compute";
  version = "1.42.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_compute";
    inherit version;
    hash = "sha256-CLHbxXWLqlSRCHvO+1dOWdkRUgtxTtp5tOvxy0KdjZg=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    proto-plus
    protobuf
  ] ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.compute"
    "google.cloud.compute_v1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "API Client library for Google Cloud Compute";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-compute";
    license = lib.licenses.asl20;
  };
}
