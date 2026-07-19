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
  version = "1.2.2";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_wtf";
    inherit version;
    hash = "sha256-edLuHkNs9XC8y32RZTP6GHV6LxjCkKzP+rG5oLaEZms=";
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
