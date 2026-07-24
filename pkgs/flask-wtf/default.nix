{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,

  # dependencies
  flask,
  itsdangerous,
  wtforms,
}:

buildPythonPackage rec {
  pname = "flask-wtf";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_wtf";
    inherit version;
    hash = "sha256-YdXavFDD34hcKX3L2AgQRDpdYyEGyKacq4znQPDN18w=";
  };

  build-system = [ hatchling ];

  dependencies = [
    flask
    itsdangerous
    wtforms
  ];

  doCheck = false;

  pythonImportsCheck = [ "flask_wtf" ];

  meta = {
    description = "Simple integration of Flask and WTForms";
    homepage = "https://github.com/pallets-eco/flask-wtf/";
    license = lib.licenses.bsd3;
  };
}
