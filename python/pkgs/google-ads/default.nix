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

buildPythonPackage rec {
  pname = "google-ads";
  version = "31.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_ads";
    inherit version;
    hash = "sha256-cJkYHBp/Ync5tcac+GRyurRi/Mt0PsdlniUvuH+hp9o=";
  };

  build-system = [ setuptools ];

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
}
