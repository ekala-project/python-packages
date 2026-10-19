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

buildPythonPackage (finalAttrs: {
  pname = "mapclassify";
  version = "2.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pysal";
    repo = "mapclassify";
    tag = "v${finalAttrs.version}";
    hash = "sha256-QmGSMkCBAzpWLmDcSjwa8DibAA0JsNHjgjmb8zBuXno=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
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
  };
})
