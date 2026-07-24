{
  lib,
  buildPythonPackage,
  dbt-core,
  fetchPypi,
  hatchling,
  snowflake-connector-python,
}:

buildPythonPackage rec {
  pname = "dbt-snowflake";
  version = "1.11.1";
  pyproject = true;

  # missing tags on GitHub
  src = fetchPypi {
    pname = "dbt_snowflake";
    inherit version;
    hash = "sha256-C2uS13vwN9AuZ0XgrdRHMsunuzSwoM06HGFmJ45Bs0A=";
  };

  pythonRelaxDeps = [
    "certifi"
  ];

  build-system = [ hatchling ];

  dependencies = [
    dbt-core
    snowflake-connector-python
  ]
  ++ snowflake-connector-python.optional-dependencies.secure-local-storage;
  pythonImportsCheck = [ "dbt.adapters.snowflake" ];

  meta = {
    description = "Plugin enabling dbt to work with Snowflake";
    homepage = "https://github.com/dbt-labs/dbt-adapters/blob/main/dbt-snowflake";
    license = lib.licenses.asl20;
  };
}
