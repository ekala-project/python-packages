{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  google-auth-oauthlib,
  google-api-core,
  googleapis-common-protos,
  grpcio,
  grpcio-status,
  proto-plus,
  protobuf,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "google-ads";
  version = "35.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_ads";
    inherit (finalAttrs) version;
    hash = "sha256-6uBw3EbiwSEuuDUjE1J7D2Yyz8yJGcBlrD4A35KY3IU=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "google-api-core" ];

  dependencies = [
    google-auth-oauthlib
    google-api-core
    googleapis-common-protos
    grpcio
    grpcio-status
    proto-plus
    protobuf
    pyyaml
  ];

  pythonImportsCheck = [ "google.ads" ];

  pythonNamespaces = [ "google.ads" ];

  meta = {
    description = "Client library for the Google Ads API";
    homepage = "https://github.com/googleads/google-ads-python";
    license = lib.licenses.asl20;
  };
})
