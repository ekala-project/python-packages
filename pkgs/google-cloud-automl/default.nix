{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  google-cloud-storage,
  libcst,
  pandas,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-automl";
  version = "2.20.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_automl";
    inherit version;
    hash = "sha256-3BaZODxm3KaDecL6iM0JQz9mOwaOvOTnb1HJ8sCOzEA=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "protobuf" ];

  dependencies = [
    google-api-core
    proto-plus
    protobuf
  ] ++ google-api-core.optional-dependencies.grpc;

  optional-dependencies = {
    libcst = [ libcst ];
    pandas = [ pandas ];
    storage = [ google-cloud-storage ];
  };

  pythonImportsCheck = [
    "google.cloud.automl"
    "google.cloud.automl_v1"
    "google.cloud.automl_v1beta1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Cloud AutoML API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-automl";
    license = lib.licenses.asl20;
  };
}
