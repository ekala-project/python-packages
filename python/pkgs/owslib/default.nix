{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  lxml,
  python-dateutil,
  pyyaml,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "owslib";
  version = "0.36.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "geopython";
    repo = "OWSLib";
    tag = version;
    hash = "sha256-Of/CSLcNnpTYHRm4toQK4/HXTWNcuEMkW6obWpg96Tc=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools<69" "setuptools"
  '';

  build-system = [ setuptools ];

  dependencies = [
    lxml
    python-dateutil
    pyyaml
    requests
  ];

  pythonImportsCheck = [ "owslib" ];

  meta = {
    description = "Client for Open Geospatial Consortium web service interface standards";
    homepage = "https://www.osgeo.org/projects/owslib/";
    license = lib.licenses.bsd3;
    teams = [ lib.teams.geospatial ];
  };
}
