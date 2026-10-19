{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  geojson,
  haversine,
  pytz,
  requests,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "geojson-client";
  version = "0.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "exxamalte";
    repo = "python-geojson-client";
    tag = "v${version}";
    hash = "sha256-nzM5P1ww6yWM3e2v3hRw0ECoYmRPhTs0Q7Wwicl+IpU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    geojson
    haversine
    pytz
    requests
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "geojson_client" ];

  meta = {
    description = "Python module for convenient access to GeoJSON feeds";
    homepage = "https://github.com/exxamalte/python-geojson-client";
    license = lib.licenses.asl20;
  };
}
