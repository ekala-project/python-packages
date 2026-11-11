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

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-speech";
  version = "2.41.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_speech";
    inherit (finalAttrs) version;
    hash = "sha256-8avwwyYPvzpMPfnt6KgBO7Qr3Vg8u/7rp1LHpPeB0mE=";
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
})
