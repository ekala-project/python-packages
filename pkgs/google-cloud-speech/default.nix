{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  google-auth,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-speech";
  version = "2.40.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_speech";
    inherit version;
    hash = "sha256-6J5ojkzguSZ1QDi/mS0NDwZcXxw1A7sg5sRtCLY2WPw=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    google-auth
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.speech"
    "google.cloud.speech_v1"
    "google.cloud.speech_v1p1beta1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Speech API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-speech";
    license = lib.licenses.asl20;
  };
}
