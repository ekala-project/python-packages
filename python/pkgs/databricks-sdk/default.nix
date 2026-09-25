{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  google-auth,
  protobuf,
  requests,

  # tests
  langchain-openai,
  openai,
  pyfakefs,
  pytest-mock,
  requests-mock,
}:

buildPythonPackage (finalAttrs: {
  pname = "databricks-sdk";
  version = "0.136.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "databricks";
    repo = "databricks-sdk-py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-oxWgm0tjD0bWFMqpRf/xfVqNPf7iOe1uVTS4mUHArlM=";
  };

  build-system = [
    setuptools
  ];

  pythonRelaxDeps = [
    # For protobuf 7
    "protobuf"
  ];

  dependencies = [
    google-auth
    protobuf
    requests
  ];

  pythonImportsCheck = [
    "databricks.sdk"
  ];
  meta = {
    description = "Databricks SDK for Python";
    homepage = "https://github.com/databricks/databricks-sdk-py";
    license = lib.licenses.asl20;
  };
})
