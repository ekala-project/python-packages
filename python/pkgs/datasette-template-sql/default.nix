{
  lib,
  buildPythonPackage,
  datasette,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "datasette-template-sql";
  version = "1.0.2";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "simonw";
    repo = "datasette-template-sql";
    tag = version;
    hash = "sha256-VmdIEDk3iCBFrTPMm6ud00Z5CWqO0Wk707IQ4oVx5ak=";
  };

  dependencies = [ datasette ];

  # Tests require a running datasette instance

  pythonImportsCheck = [ "datasette_template_sql" ];

  meta = {
    description = "Datasette plugin for executing SQL queries from templates";
    homepage = "https://datasette.io/plugins/datasette-template-sql";
    license = lib.licenses.asl20;
  };
}
