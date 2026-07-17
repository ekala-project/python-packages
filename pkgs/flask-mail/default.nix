{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  flit-core,

  # dependencies
  blinker,
  flask,
}:

buildPythonPackage rec {
  pname = "flask-mail";
  version = "0.10.0";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_mail";
    inherit version;
    hash = "sha256-RAg+ewK7zOeSIJwGJS+Fad1aMlp6qnav5zMEIr2XiB0=";
  };

  build-system = [ flit-core ];

  dependencies = [
    blinker
    flask
  ];

  doCheck = false;

  pythonImportsCheck = [ "flask_mail" ];

  meta = {
    description = "Flask extension providing simple email sending capabilities";
    homepage = "https://github.com/pallets-eco/flask-mail";
    license = lib.licenses.bsd3;
  };
}
