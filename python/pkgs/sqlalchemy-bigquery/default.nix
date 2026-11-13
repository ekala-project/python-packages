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

buildPythonPackage (finalAttrs: {
  pname = "sqlalchemy-bigquery";
  version = "1.17.3";
  pyproject = true;

  src = fetchPypi {
    pname = "sqlalchemy_bigquery";
    inherit (finalAttrs) version;
    hash = "sha256-eSfI/Re3rbdtoFj8ZJRiaxJOD20BG9zoxHfHc1KySIk=";
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

  meta = {
    description = "SQLAlchemy dialect for BigQuery";
    homepage = "https://github.com/googleapis/python-bigquery-sqlalchemy";
    license = lib.licenses.mit;
  };
})
