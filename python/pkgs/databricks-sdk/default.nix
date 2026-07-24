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
  version = "0.121.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "databricks";
    repo = "databricks-sdk-py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-EvTh2zxQE7xSzxaipI8qeG0tK/Bnk8bDKbWKdMDO0F4=";
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
    maintainers = [ ];
  };
})
