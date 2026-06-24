{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython,
  setuptools,

  # dependencies
  cachetools,
  click,
  fsspec,
  mmh3,
  pydantic,
  pyparsing,
  requests,
  rich,
  tenacity,
  zstandard,

  # optional-dependencies
  google-cloud-bigquery,
  duckdb,
  pyarrow ? null,
  boto3,
  azure-identity,
  google-auth,
  gcsfs,
  huggingface-hub,
  pandas,
  polars,
  s3fs,
  sqlalchemy,
}:

buildPythonPackage (finalAttrs: {
  pname = "iceberg-python";
  version = "0.11.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "apache";
    repo = "iceberg-python";
    tag = "pyiceberg-${finalAttrs.version}";
    hash = "sha256-MjBvLJOnjtpIwBMkI+81S6aipye+PnbrC8T317Qj6rY=";
  };

  build-system = [
    cython
    setuptools
  ];

  # Prevents the cython build to fail silently
  env.CIBUILDWHEEL = "1";

  dependencies = [
    cachetools
    click
    fsspec
    mmh3
    pydantic
    pyparsing
    requests
    rich
    tenacity
    zstandard
  ];

  optional-dependencies = {
    bigquery = [
      google-cloud-bigquery
    ];
    bodo = [
      # bodo
    ];
    daft = [
      # daft
    ];
    duckdb = [
      duckdb
    ] ++ lib.optionals (pyarrow != null) [ pyarrow ];
    dynamodb = [
      boto3
    ];
    entra-auth = [
      azure-identity
    ];
    gcp-auth = [
      google-auth
    ];
    gcsfs = [
      gcsfs
    ];
    glue = [
      boto3
    ];
    hf = [
      huggingface-hub
    ];
    pandas = [
      pandas
    ] ++ lib.optionals (pyarrow != null) [ pyarrow ];
    polars = [
      polars
    ];
    pyarrow = lib.optionals (pyarrow != null) [
      pyarrow
    ];
    rest-sigv4 = [
      boto3
    ];
    s3fs = [
      s3fs
    ];
    sql-postgres = [
      sqlalchemy
    ];
    sql-sqlite = [
      sqlalchemy
    ];
  };

  pythonImportsCheck = [
    "pyiceberg"
    # Compiled avro decoder (cython)
    "pyiceberg.avro.decoder_fast"
  ];

  meta = {
    description = "Python library for programmatic access to Apache Iceberg";
    homepage = "https://github.com/apache/iceberg-python";
    license = lib.licenses.asl20;
  };
})
