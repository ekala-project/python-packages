{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  flask,
  blinker,
}:

buildPythonPackage rec {
  pname = "flask-principal";
  version = "0.4.0";
  pyproject = true;

  src = fetchPypi {
    pname = "Flask-Principal";
    inherit version;
    hash = "sha256-9dYTS1yuv9u4bzLVbRjuRLCAh2onJpVgqW6jX3XJlFM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    flask
    blinker
  ];

  doCheck = false;

  pythonImportsCheck = [ "flask_principal" ];

  meta = {
    description = "Identity management for Flask";
    homepage = "http://packages.python.org/Flask-Principal/";
    license = lib.licenses.mit;
  };
}
