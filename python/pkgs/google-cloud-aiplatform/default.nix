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

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-aiplatform";
  version = "2.8.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_aiplatform";
    inherit (finalAttrs) version;
    hash = "sha256-P1iWYPVOC0AwYwRA0kczsOxcek6c55nMTzjBNzamD28=";
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
})
