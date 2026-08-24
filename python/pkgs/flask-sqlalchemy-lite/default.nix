{
  buildPythonPackage,
  fetchFromGitHub,
  flask,
  flit-core,
  lib,
  sqlalchemy,
}:

buildPythonPackage rec {
  pname = "flask-sqlalchemy-lite";
  version = "0.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pallets-eco";
    repo = "flask-sqlalchemy-lite";
    tag = version;
    hash = "sha256-KX4kpqgvNlcAe4NSWaSkcgtPQINmeQOx46/4uFM8q8A=";
  };

  build-system = [ flit-core ];

  dependencies = [
    flask
    sqlalchemy
  ];
  pythonImportsCheck = [ "flask_sqlalchemy_lite" ];

  meta = {
    description = "Integrate SQLAlchemy with Flask";
    homepage = "https://github.com/pallets-eco/flask-sqlalchemy-lite";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
