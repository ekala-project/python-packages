{
  lib,
  attrs,
  boto3,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  mock,
  pytest-mock,
  setuptools,
  wrapt,
}:

buildPythonPackage (finalAttrs: {
  pname = "aws-encryption-sdk";
  version = "4.0.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aws";
    repo = "aws-encryption-sdk-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-JVvcBKHLf4jMinUl6Z52PNteSS6XeaqGqZsnvJ9aSXQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    attrs
    boto3
    cryptography
    wrapt
  ];
  pythonImportsCheck = [ "aws_encryption_sdk" ];

  meta = {
    description = "Python implementation of the AWS Encryption SDK";
    homepage = "https://aws-encryption-sdk-python.readthedocs.io/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
