{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-texttospeech";
  version = "2.37.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_texttospeech";
    inherit version;
    hash = "sha256-23JjgvOTzrazYALDWr1itTxNjhf8LzHfiwf9D6u+T4s=";
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
    "google.cloud.texttospeech"
    "google.cloud.texttospeech_v1"
    "google.cloud.texttospeech_v1beta1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Text-to-Speech API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-texttospeech";
    license = lib.licenses.asl20;
  };
}
