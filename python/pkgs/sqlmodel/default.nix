{
  lib,
  buildPythonPackage,
  black,
  jinja2,
  dirty-equals,
  fastapi,
  fetchFromGitHub,
  pdm-backend,
  pydantic,
  sqlalchemy,
}:

buildPythonPackage (finalAttrs: {
  pname = "sqlmodel";
  version = "0.0.42";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tiangolo";
    repo = "sqlmodel";
    tag = finalAttrs.version;
    hash = "sha256-fhj3mWep7Wdw9AYu9ibIWY5plKe+w6F6PghiUsb6z5o=";
  };

  build-system = [ pdm-backend ];

  dependencies = [
    pydantic
    sqlalchemy
  ];
  pythonImportsCheck = [ "sqlmodel" ];
  meta = {
    description = "Module to work with SQL databases";
    homepage = "https://github.com/fastapi/sqlmodel";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
