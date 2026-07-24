{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  botocore,
  click,
  inquirer,
  jmespath,
  pip,
  pyyaml,
  six,

  # tests
  hypothesis,
  requests,
  websocket-client,
}:

buildPythonPackage (finalAttrs: {
  pname = "chalice";
  version = "1.33.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aws";
    repo = "chalice";
    tag = finalAttrs.version;
    hash = "sha256-c5xzgrxRFRlvgMnf/L8rhG7rYJLtuMvDZHYsPaHkdRs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    botocore
    click
    inquirer
    jmespath
    pip
    pyyaml
    # setuptools
    six
  ];

  pythonRelaxDeps = [ "pip" ];
  pythonImportsCheck = [ "chalice" ];

  meta = {
    description = "Python Serverless Microframework for AWS";
    mainProgram = "chalice";
    homepage = "https://github.com/aws/chalice";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
