{
  lib,
  aioboto3,
  aiohttp,
  asn1crypto,
  buildPythonPackage,
  boto3,
  botocore,
  certifi,
  charset-normalizer,
  cryptography,
  cython,
  fetchFromGitHub,
  filelock,
  idna,
  keyring,
  numpy,
  packaging,
  pandas,
  platformdirs,
  pyarrow,
  pyjwt,
  pyopenssl,
  pytest-asyncio,
  pytest-xdist,
  pytz,
  requests,
  responses,
  setuptools,
  sortedcontainers,
  tomlkit,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "snowflake-connector-python";
  version = "4.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "snowflakedb";
    repo = "snowflake-connector-python";
    tag = "v${version}";
    hash = "sha256-bJK6U5lomcPMGeKEmv+9m+uM5+3GJKKUA3dEwP/ynVo=";
  };

  build-system = [
    cython
    setuptools
  ];

  dependencies = [
    asn1crypto
    certifi
    charset-normalizer
    cryptography
    filelock
    idna
    packaging
    platformdirs
    pyjwt
    pyopenssl
    pytz
    requests
    sortedcontainers
    tomlkit
    typing-extensions
  ];

  pythonRelaxDeps = [
    "pyopenssl"
  ];

  optional-dependencies = {
    boto = [
      boto3
      botocore
    ];
    pandas = [
      pandas
      pyarrow
    ];
    secure-local-storage = [ keyring ];
  };
  pythonImportsCheck = [
    "snowflake"
    "snowflake.connector"
  ];

  meta = {
    description = "Snowflake Connector for Python";
    homepage = "https://github.com/snowflakedb/snowflake-connector-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
