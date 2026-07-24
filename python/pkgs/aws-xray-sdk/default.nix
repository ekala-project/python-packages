{
  lib,
  botocore,
  buildPythonPackage,
  fetchFromGitHub,
  jsonpickle,
  requests,
  setuptools,
  wrapt,
}:

buildPythonPackage rec {
  pname = "aws-xray-sdk";
  version = "2.15.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aws";
    repo = "aws-xray-sdk-python";
    tag = version;
    hash = "sha256-Zu2+awB6Ynxp6hkY1bB1f6u+KpDvCcoGxDWanSH+yBY=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    botocore
    jsonpickle
    requests
    wrapt
  ];
  pythonImportsCheck = [ "aws_xray_sdk" ];

  meta = {
    description = "AWS X-Ray SDK for the Python programming language";
    homepage = "https://github.com/aws/aws-xray-sdk-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
