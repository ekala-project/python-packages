{ lib
, buildPythonPackage
, fetchFromGitHub
, geojson
, pysocks
, requests
, setuptools
,
}:

buildPythonPackage rec {
  pname = "pyowm";
  version = "3.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "csparpa";
    repo = "pyowm";
    tag = version;
    hash = "sha256-D1Cl3uWoEIUqA0R+bjRL2YgsVKj5inuBAVLJYluADg0=";
  };

  pythonRelaxDeps = [ "geojson" ];

  build-system = [ setuptools ];

  dependencies = [
    geojson
    pysocks
    requests
    setuptools
  ];

  # Run only tests which don't require network access

  pythonImportsCheck = [ "pyowm" ];

  meta = {
    description = "Python wrapper around the OpenWeatherMap web API";
    homepage = "https://pyowm.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
