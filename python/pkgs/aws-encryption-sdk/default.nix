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
  version = "4.0.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aws";
    repo = "aws-encryption-sdk-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-E3Kc0GREozdXzM5LvH1iapYl9yr17TyxauCooeJeLxo=";
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
