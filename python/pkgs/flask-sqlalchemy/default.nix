{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
  flask,
  sqlalchemy,
}:

buildPythonPackage rec {
  pname = "flask-sqlalchemy";
  version = "3.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_sqlalchemy";
    inherit version;
    hash = "sha256-5LaLuIGALdoafYeLL8hMBtHuV/tAuHTT3Jfav6NrgxI=";
  };

  build-system = [ flit-core ];

  dependencies = [
    flask
    sqlalchemy
  ];

  doCheck = false;

  pythonImportsCheck = [ "flask_sqlalchemy" ];

  meta = {
    description = "SQLAlchemy extension for Flask";
    homepage = "http://flask-sqlalchemy.pocoo.org/";
    license = lib.licenses.bsd3;
  };
}
