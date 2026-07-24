{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  networkx,
  numpy,
  pandas,
  scikit-learn,
  scipy,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "mapclassify";
  version = "2.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pysal";
    repo = "mapclassify";
    tag = "v${version}";
    hash = "sha256-OQpDrxa0zRPDAdyS6KP5enb/JZwbYoXTV8kUijV3tNM=";
  };

  build-system = [ setuptools-scm ];

  propagatedBuildInputs = [
    networkx
    numpy
    pandas
    scikit-learn
    scipy
  ];
  # requires network access
  pythonImportsCheck = [ "mapclassify" ];

  meta = {
    description = "Classification Schemes for Choropleth Maps";
    homepage = "https://pysal.org/mapclassify/";
    license = lib.licenses.bsd3;
    teams = [ lib.teams.geospatial ];
  };
}
