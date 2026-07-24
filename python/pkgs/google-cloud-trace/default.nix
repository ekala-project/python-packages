{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  google-cloud-testutils,
  mock,
  proto-plus,
  protobuf,
  pytest-asyncio,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-trace";
  version = "1.20.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_trace";
    inherit version;
    hash = "sha256-9ab5uNpTC3bEUhY7g+UIHBaW8bT2cpDIeLDnNw8ekQo=";
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
    "google.cloud.trace"
    "google.cloud.trace_v1"
    "google.cloud.trace_v2"
  ];

  meta = {
    description = "Cloud Trace API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-trace";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
