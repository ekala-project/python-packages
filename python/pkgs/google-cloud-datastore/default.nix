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
  version = "2.25.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_datastore";
    inherit (finalAttrs) version;
    hash = "sha256-3WRqPY+ZwnULtfbg8Y7Oe+2V/XbgLayt2/o1orIjKP8=";
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
    maintainers = [ ];
  };
})
