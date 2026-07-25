{
  lib,
  boto3,
  buildPythonPackage,
  fetchFromGitHub,
  gremlinpython,
  hatchling,
  jsonpath-ng,
  openpyxl,
  opensearch-py,
  pandas,
  pg8000,
  progressbar2,
  pyarrow,
  pymysql,
  pyodbc,
  redshift-connector,
  requests-aws4auth,
  setuptools,
  sparqlwrapper,
}:

buildPythonPackage (finalAttrs: {
  pname = "awswrangler";
  version = "3.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aws";
    repo = "aws-sdk-pandas";
    tag = finalAttrs.version;
    hash = "sha256-utxSM8S3uelwrLHrXx5NglOmqjS7YKnAPujNS7UhWf8=";
  };

  pythonRelaxDeps = [
    "packaging"
    "pyarrow"
  ];

  build-system = [ hatchling ];

  dependencies = [
    boto3
    gremlinpython
    jsonpath-ng
    openpyxl
    opensearch-py
    pandas
    pg8000
    progressbar2
    pyarrow
    pymysql
    redshift-connector
    requests-aws4auth
    setuptools
  ];

  optional-dependencies = {
    sqlserver = [ pyodbc ];
    sparql = [ sparqlwrapper ];
  };
  pythonImportsCheck = [ "awswrangler" ];
  meta = {
    description = "Pandas on AWS";
    homepage = "https://github.com/aws/aws-sdk-pandas";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
