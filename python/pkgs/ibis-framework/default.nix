{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,

  # build-system
  hatchling,

  # dependencies
  atpublic,
  parsy,
  python-dateutil,
  sqlglot,
  toolz,
  typing-extensions,
  tzdata,

  # tests
  black,
  filelock,
  hypothesis,
  pytest-benchmark,
  pytest-httpserver,
  pytest-mock,
  pytest-randomly,
  pytest-snapshot,
  pytest-timeout,
  pytest-xdist,
  # - athena
  pyathena,
  fsspec,
  # - bigquery
  db-dtypes,
  google-cloud-bigquery,
  google-cloud-bigquery-storage,
  pyarrow,
  pyarrow-hotfix,
  pydata-google-auth,
  numpy,
  pandas,
  rich,
  # - clickhouse
  clickhouse-connect,
  # - databricks
  # databricks-sql-connector-core, (unpackaged)
  # - datafusion
  datafusion,
  # - druid
  pydruid,
  # - duckdb
  duckdb,
  packaging,
  # - flink
  # - geospatial
  geopandas,
  shapely,
  # - mssql
  pyodbc,
  # - mysql
  pymysql,
  # - oracle
  oracledb,
  # - polars
  polars,
  # - postgres
  psycopg2,
  # - pyspark
  pyspark,
  # - snowflake
  snowflake-connector-python,
  # sqlite
  regex,
  # - trino
  trino-python-client,
  # - visualization
  graphviz,
  # examples
  pins,
}:
let
  testBackends = [
    "duckdb"
    "sqlite"
  ];

  ibisTestingData = fetchFromGitHub {
    owner = "ibis-project";
    repo = "testing-data";
    # https://github.com/ibis-project/ibis/blob/10.5.0/nix/overlay.nix#L94-L100
    rev = "b26bd40cf29004372319df620c4bbe41420bb6f8";
    hash = "sha256-1fenQNQB+Q0pbb0cbK2S/UIwZDE4PXXG15MH3aVbyLU=";
  };
in

buildPythonPackage (finalAttrs: {
  pname = "ibis-framework";
  version = "12.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ibis-project";
    repo = "ibis";
    tag = finalAttrs.version;
    hash = "sha256-GqSbjjUr4EaWueMl4TrhaDvqn1iDd4CO3QcDnOXfSAk=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    atpublic
    parsy
    python-dateutil
    sqlglot
    toolz
    typing-extensions
    tzdata
  ];
  enabledTestMarks = testBackends ++ [ "core" ];
  # patch out tests that check formatting with black
  postPatch = ''
    find ibis/tests -type f -name '*.py' -exec sed -i \
      -e '/^ *assert_decompile_roundtrip/d' \
      -e 's/^\( *\)code = ibis.decompile(expr, format=True)/\1code = ibis.decompile(expr)/g' {} +
  '';
  postCheck = ''
    rm -r "$IBIS_TEST_DATA_DIRECTORY"
  '';

  pythonImportsCheck = [ "ibis" ] ++ map (backend: "ibis.backends.${backend}") testBackends;

  optional-dependencies = {
    athena = [
      pyathena
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
      packaging
      fsspec
    ];
    bigquery = [
      db-dtypes
      google-cloud-bigquery
      google-cloud-bigquery-storage
      pyarrow
      pyarrow-hotfix
      pydata-google-auth
      numpy
      pandas
      rich
    ];
    clickhouse = [
      clickhouse-connect
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    databricks = [
      # databricks-sql-connector-core (unpackaged)
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    datafusion = [
      datafusion
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    druid = [
      pydruid
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    duckdb = [
      duckdb
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
      packaging
    ];
    flink = [
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    geospatial = [
      geopandas
      shapely
    ];
    mssql = [
      pyodbc
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    mysql = [
      pymysql
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    oracle = [
      oracledb
      packaging
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    polars = [
      polars
      packaging
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    postgres = [
      psycopg2
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    pyspark = [
      pyspark
      packaging
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    snowflake = [
      snowflake-connector-python
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    sqlite = [
      regex
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    trino = [
      trino-python-client
      pyarrow
      pyarrow-hotfix
      numpy
      pandas
      rich
    ];
    visualization = [ graphviz ];
    decompiler = [ black ];
    examples = [ pins ] ++ pins.optional-dependencies.gcs;
  };

  meta = {
    description = "Productivity-centric Python Big Data Framework";
    homepage = "https://github.com/ibis-project/ibis";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
