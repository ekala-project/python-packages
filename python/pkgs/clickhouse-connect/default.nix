{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cython,
  # install_requires
  certifi,
  importlib-metadata,
  urllib3,
  pytz,
  zstandard,
  lz4,
  # extras_require
  sqlalchemy,
  numpy,
  pandas,
  pyarrow,
  orjson,
  # not in tests_require, but should be
  pytest-dotenv,
}:
buildPythonPackage rec {
  pname = "clickhouse-connect";
  version = "1.8.0";

  format = "setuptools";

  src = fetchFromGitHub {
    repo = "clickhouse-connect";
    owner = "ClickHouse";
    tag = "v${version}";
    hash = "sha256-CtFOHy/pBtjRx2alKfYSipHsaDEht7xPig0J5yxQvoQ=";
  };

  nativeBuildInputs = [ cython ];
  setupPyBuildFlags = [ "--inplace" ];
  enableParallelBuilding = true;

  propagatedBuildInputs = [
    certifi
    importlib-metadata
    numpy
    urllib3
    pytz
    zstandard
    lz4
  ];
  # These tests require a running ClickHouse instance or a reachable HTTP endpoint.
  pythonImportsCheck = [
    "clickhouse_connect"
    "clickhouse_connect.driverc.buffer"
    "clickhouse_connect.driverc.dataconv"
    "clickhouse_connect.driverc.npconv"
  ];

  optional-dependencies = {
    sqlalchemy = [ sqlalchemy ];
    numpy = [ numpy ];
    pandas = [ pandas ];
    arrow = [ pyarrow ];
    orjson = [ orjson ];
  };

  meta = {
    description = "ClickHouse Database Core Driver for Python, Pandas, and Superset";
    homepage = "https://github.com/ClickHouse/clickhouse-connect";
    license = lib.licenses.asl20;
  };
}
