{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  flask,
}:

buildPythonPackage rec {
  pname = "flask-testing";
  version = "0.8.1";
  pyproject = true;

  src = fetchPypi {
    pname = "Flask-Testing";
    inherit version;
    hash = "sha256-CnNNe2jmOpQQtBPNex+WRW+ahYvQmmIi1GVlDMeC6wE=";
  };

  build-system = [ setuptools ];

  dependencies = [ flask ];

  pythonImportsCheck = [ "flask_testing" ];

  meta = {
    description = "Extension provides unit testing utilities for Flask";
    homepage = "https://pythonhosted.org/Flask-Testing/";
    license = lib.licenses.bsd3;
  };
}
