{
  lib,
  buildPythonPackage,
  click,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytest-cov-stub,
  pyyaml,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "cfn-flip";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "awslabs";
    repo = "aws-cfn-template-flip";
    tag = finalAttrs.version;
    hash = "sha256-lfhTR3+D1FvblhQGF83AB8+I8WDPBTmo+q22ksgDgt4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click
    pyyaml
    six
  ];
  pythonImportsCheck = [ "cfn_flip" ];

  meta = {
    description = "Tool for converting AWS CloudFormation templates between JSON and YAML formats";
    mainProgram = "cfn-flip";
    homepage = "https://github.com/awslabs/aws-cfn-template-flip";
    license = lib.licenses.asl20;
  };
})
