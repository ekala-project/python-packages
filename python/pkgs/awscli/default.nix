{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  botocore,
  colorama,
  docutils,
  pyyaml,
  rsa,
  s3transfer,
}:

buildPythonPackage (finalAttrs: {
  pname = "awscli";
  version = "1.44.21";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aws";
    repo = "aws-cli";
    tag = finalAttrs.version;
    hash = "sha256-yQFK1YjehmACZGMXfMQLc5OiiIGDO08OtwFSpaRyi58=";
  };

  pythonRelaxDeps = [
    "docutils"
    "rsa"
  ];

  build-system = [
    setuptools
  ];

  dependencies = [
    botocore
    colorama
    docutils
    pyyaml
    rsa
    s3transfer
  ];

  pythonImportsCheck = [ "awscli" ];

  meta = {
    homepage = "https://aws.amazon.com/cli/";
    description = "Unified tool to manage your AWS services";
    license = lib.licenses.asl20;
    mainProgram = "aws";
  };
})
