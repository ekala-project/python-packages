{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  boto3,
  importlib-metadata,
  jsonschema,
  mock,
  platformdirs,
  pydantic,
  pyyaml,
  rich,

  # optional-dependencies
  black,
  pandas,
  pylint,
  pytest,

  # tests
}:

buildPythonPackage (finalAttrs: {
  pname = "sagemaker-core";
  version = "1.0.78";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aws";
    repo = "sagemaker-core";
    tag = "v${finalAttrs.version}";
    hash = "sha256-pSxOMbw6ZUdlVTYoSW5ZwpTTh5VEJFf8U6sNq6kb5vM=";
  };

  build-system = [
    setuptools
  ];

  pythonRelaxDeps = [
    "boto3"
    "importlib-metadata"
    "mock"
    "rich"
  ];

  dependencies = [
    boto3
    importlib-metadata
    jsonschema
    mock
    platformdirs
    pydantic
    pyyaml
    rich
  ];

  optional-dependencies = {
    codegen = [
      black
      pandas
      pylint
      pytest
    ];
  };

  pythonImportsCheck = [
    "sagemaker_core"
  ];
  meta = {
    description = "Python object-oriented interface for interacting with Amazon SageMaker resources";
    homepage = "https://github.com/aws/sagemaker-core";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
