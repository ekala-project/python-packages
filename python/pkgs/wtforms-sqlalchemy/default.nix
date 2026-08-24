{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  sqlalchemy,
  wtforms,
}:

buildPythonPackage rec {
  pname = "wtforms-sqlalchemy";
  version = "0.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wtforms";
    repo = "wtforms-sqlalchemy";
    tag = version;
    hash = "sha256-E2F8lOcgne2yGEyn6g8j3mHr045eOyKu77DFGwWTPkc=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    sqlalchemy
    wtforms
  ];

  pythonImportsCheck = [ "wtforms_sqlalchemy" ];

  meta = {
    description = "WTForms integration for SQLAlchemy";
    homepage = "https://github.com/wtforms/wtforms-sqlalchemy";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
