{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  protobuf,
  proto-plus,
  pytest-asyncio,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-os-config";
  version = "1.26.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_os_config";
    inherit (finalAttrs) version;
    hash = "sha256-UfWpARWvtg6oTg8OS5OMQGfP8VyvzRij4JvLkjwkptA=";
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
  pythonImportsCheck = [ "google.cloud.osconfig" ];
  meta = {
    description = "Google Cloud OS Config API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-os-config";
    license = lib.licenses.asl20;
  };
})
