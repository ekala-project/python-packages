{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  google-cloud-core,
  google-cloud-testutils,
  libcst,
  mock,
  proto-plus,
  protobuf,
  pytest-asyncio,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-datastore";
  version = "2.26.1";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_datastore";
    inherit (finalAttrs) version;
    hash = "sha256-V6HCsn9ns6XwmtXgFcjqSzQ9TZgKhZoN2aZh3XngA/g=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "protobuf" ];

  dependencies = [
    google-api-core
    google-cloud-core
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  optional-dependencies = {
    libcst = [ libcst ];
  };
  pythonImportsCheck = [
    "google.cloud.datastore"
    "google.cloud.datastore_admin_v1"
    "google.cloud.datastore_v1"
  ];

  meta = {
    description = "Google Cloud Datastore API client library";
    homepage = "https://cloud.google.com/datastore";
    license = lib.licenses.asl20;
  };
})
