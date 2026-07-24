{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-cov-stub,
  requests,
  responses,
  setuptools,
}:

buildPythonPackage rec {
  pname = "googlemaps";
  version = "4.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googlemaps";
    repo = "google-maps-services-python";
    tag = "v${version}";
    hash = "sha256-8oGZEMKUGaDHKq4qIZy10cbLNMmVclJnQE/dx877pNQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
  ];
  pythonImportsCheck = [ "googlemaps" ];

  meta = {
    description = "Python client library for Google Maps API Web Services";
    homepage = "https://github.com/googlemaps/google-maps-services-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
