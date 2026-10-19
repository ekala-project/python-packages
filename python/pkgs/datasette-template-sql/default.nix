{
  lib,
  buildPythonPackage,
  datasette,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "datasette-template-sql";
  version = "1.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "simonw";
    repo = "datasette-template-sql";
    tag = finalAttrs.version;
    hash = "sha256-VmdIEDk3iCBFrTPMm6ud00Z5CWqO0Wk707IQ4oVx5ak=";
  };

  build-system = [ setuptools ];

  dependencies = [ datasette ];

  # Tests require a running datasette instance

  pythonImportsCheck = [ "datasette_template_sql" ];

  meta = {
    description = "Datasette plugin for executing SQL queries from templates";
    homepage = "https://datasette.io/plugins/datasette-template-sql";
    license = lib.licenses.asl20;
  };
})
