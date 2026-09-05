{
  lib,
  boto3,
  buildPythonPackage,
  fetchFromGitHub,
  jsonschema,
  parameterized,
  pydantic,
  pytest-env,
  pytest-rerunfailures,
  pytest-xdist,
  pyyaml,
  requests,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "aws-sam-translator";
  version = "1.113.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aws";
    repo = "serverless-application-model";
    tag = "v${version}";
    hash = "sha256-gEW7oOysAD9Czk8MDziyrnW5bDw4GCYpA0aZOHXnEEI=";
  };

  postPatch = ''
    # don't try to use --cov or fail on new warnings
    rm pytest.ini
  '';

  pythonRelaxDeps = [ "pydantic" ];

  build-system = [ setuptools ];

  dependencies = [
    boto3
    jsonschema
    pydantic
    typing-extensions
  ];
  disabledTestMarks = [
    "slow"
  ];
  pythonImportsCheck = [ "samtranslator" ];

  meta = {
    description = "Python library to transform SAM templates into AWS CloudFormation templates";
    homepage = "https://github.com/aws/serverless-application-model";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
