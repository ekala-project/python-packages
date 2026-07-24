{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  flask,
  pyjwt,
  python-dateutil,
  werkzeug,
}:

buildPythonPackage rec {
  pname = "flask-jwt-extended";
  version = "4.7.4";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_jwt_extended";
    inherit version;
    hash = "sha256-eP0PRgMX+s86AISmRX/68vHdqe771Xb5TOo1sOrdVTE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    flask
    pyjwt
    python-dateutil
    werkzeug
  ];

  pythonImportsCheck = [ "flask_jwt_extended" ];

  meta = {
    description = "JWT extension for Flask";
    homepage = "https://flask-jwt-extended.readthedocs.io/";
    license = lib.licenses.mit;
  };
}
