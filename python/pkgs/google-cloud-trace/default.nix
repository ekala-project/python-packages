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

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-trace";
  version = "1.21.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_trace";
    inherit (finalAttrs) version;
    hash = "sha256-Xg4CtR253vC+0vg2J/pQQ6juzQDkd6f7mNHgTDGnE8A=";
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
  };
})
