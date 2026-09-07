{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  google-auth,
  google-cloud-bigquery,
  google-cloud-resource-manager,
  google-cloud-storage,
  google-genai,
  packaging,
  proto-plus,
  protobuf,
  pydantic,
  docstring-parser,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "google-cloud-aiplatform";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_aiplatform";
    inherit version;
    hash = "sha256-lk7KFg1K9IouBLXuR2+004yEOI8jtEIOLHGzAVHWJb0=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    google-auth
    google-cloud-bigquery
    google-cloud-resource-manager
    google-cloud-storage
    google-genai
    packaging
    proto-plus
    protobuf
    pydantic
    docstring-parser
    typing-extensions
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.aiplatform"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud AI Platform SDK";
    homepage = "https://github.com/googleapis/python-aiplatform";
    license = lib.licenses.asl20;
  };
}
