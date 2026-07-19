{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  sqlalchemy,
  google-cloud-bigquery,
  google-api-core,
  google-auth,
  google-cloud-bigquery-storage,
  pyarrow ? null,
  pytz,
}:

buildPythonPackage rec {
  pname = "sqlalchemy-bigquery";
  version = "1.14.0";
  pyproject = true;

  src = fetchPypi {
    pname = "sqlalchemy_bigquery";
    inherit version;
    hash = "sha256-vI7EpksN8+zwGMP6YMY0HwDH31oSL4J6aJ27tVQpyK8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    google-api-core
    google-auth
    google-cloud-bigquery
    sqlalchemy
  ]
  ++ lib.optionals (pyarrow != null) [
    pyarrow
  ];

  optional-dependencies = {
    bqstorage = [ google-cloud-bigquery-storage ];
    geography = [
      # geoalchemy2
      # shapely
    ];
    alembic = [
      # alembic
    ];
  };

  pythonImportsCheck = [ "sqlalchemy_bigquery" ];

  # Tests require a BigQuery project
  doCheck = false;

  meta = {
    description = "SQLAlchemy dialect for BigQuery";
    homepage = "https://github.com/googleapis/python-bigquery-sqlalchemy";
    license = lib.licenses.mit;
  };
}
