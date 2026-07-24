{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  marshmallow,
  packaging,
  sqlalchemy,
}:

buildPythonPackage rec {
  pname = "marshmallow-sqlalchemy";
  version = "1.5.0";
  pyproject = true;

  src = fetchPypi {
    pname = "marshmallow_sqlalchemy";
    inherit version;
    hash = "sha256-5RGSwgR3BkWi+rDXL0T4eJJy7vdZUfhLFgjWtLC/4OY=";
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
}
