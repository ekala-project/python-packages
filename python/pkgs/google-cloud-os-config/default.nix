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

buildPythonPackage rec {
  pname = "google-cloud-os-config";
  version = "1.25.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_os_config";
    inherit version;
    hash = "sha256-LgJxfWoNq+j26/e5s36yi19w4zWL18rwzdvPhDswPaE=";
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
    maintainers = [ ];
  };
}
