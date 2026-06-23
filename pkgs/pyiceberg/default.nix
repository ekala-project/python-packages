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
  pyroaring,
  requests,
  rich,
  strictyaml,
  tenacity,
  zstandard,

  # optional-dependencies
  adlfs,
  google-cloud-bigquery,
  datafusion,
  duckdb,
  pyarrow,
  boto3,
  azure-identity,
  google-auth,
  gcsfs,
  huggingface-hub,
  thrift,
  kerberos,
  pandas,
  polars,
  pyiceberg-core,
  ray,
  s3fs,
  python-snappy,
  psycopg2-binary,
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
    pyroaring
    requests
    rich
    strictyaml
    tenacity
    zstandard
  ];

  optional-dependencies = {
    adlfs = [
      adlfs
    ];
    bigquery = [
      google-cloud-bigquery
    ];
    bodo = [
      # bodo
    ];
    daft = [
      # daft
    ];
    datafusion = [
      datafusion
    ];
    duckdb = [
      duckdb
      pyarrow
    ];
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
    hive = [
      thrift
    ];
    hive-kerberos = [
      kerberos
      thrift
      # thrift-sasl
    ];
    pandas = [
      pandas
      pyarrow
    ];
    polars = [
      polars
    ];
    pyarrow = [
      pyarrow
      pyiceberg-core
    ];
    pyiceberg-core = [
      pyiceberg-core
    ];
    ray = [
      pandas
      pyarrow
      ray
    ];
    rest-sigv4 = [
      boto3
    ];
    s3fs = [
      s3fs
    ];
    snappy = [
      python-snappy
    ];
    sql-postgres = [
      psycopg2-binary
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
