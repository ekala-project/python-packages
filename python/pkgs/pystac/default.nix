{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  html5lib,
  jsonschema,
  pytest-cov-stub,
  pytest-mock,
  pytest-recording,
  python-dateutil,
  requests-mock,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pystac";
  version = "1.14.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "stac-utils";
    repo = "pystac";
    tag = "v${version}";
    hash = "sha256-O17KG8DRr7KpFpZYsl7zHBKDs5Ad0vigaThBnNP17rs=";
  };

  build-system = [ setuptools ];

  propagatedBuildInputs = [ python-dateutil ];
  pythonImportsCheck = [ "pystac" ];

  meta = {
    description = "Python library for working with any SpatioTemporal Asset Catalog (STAC)";
    homepage = "https://github.com/stac-utils/pystac";
    license = lib.licenses.asl20;
    teams = [ lib.teams.geospatial ];
  };
}
