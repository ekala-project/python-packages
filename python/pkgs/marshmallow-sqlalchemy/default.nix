{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  marshmallow,
  packaging,
  sqlalchemy,
}:

buildPythonPackage (finalAttrs: {
  pname = "marshmallow-sqlalchemy";
  version = "1.6.0";
  pyproject = true;

  src = fetchPypi {
    pname = "marshmallow_sqlalchemy";
    inherit (finalAttrs) version;
    hash = "sha256-revH42p+xWYt6TsAuFC1Djb06P5nzPbp6OX/QqeLFpY=";
  };

  build-system = [ flit-core ];

  dependencies = [
    marshmallow
    packaging
    sqlalchemy
  ];

  pythonImportsCheck = [ "marshmallow_sqlalchemy" ];

  meta = {
    description = "SQLAlchemy integration with marshmallow";
    homepage = "https://github.com/marshmallow-code/marshmallow-sqlalchemy";
    license = lib.licenses.mit;
  };
})
