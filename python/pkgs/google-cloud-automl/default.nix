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

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-automl";
  version = "2.21.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_automl";
    inherit (finalAttrs) version;
    hash = "sha256-FJXJ8kQZTuPGnpPy+kieueD6L7U781u5CNV48wVKJiA=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "protobuf" ];

  dependencies = [
    google-api-core
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

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
})
