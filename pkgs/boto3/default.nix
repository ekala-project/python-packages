{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  botocore,
  jmespath,
  s3transfer,
}:

buildPythonPackage (finalAttrs: {
  pname = "boto3";
  inherit (botocore) version;
  pyproject = true;

  src = fetchFromGitHub {
    owner = "boto";
    repo = "boto3";
    tag = finalAttrs.version;
    hash = "sha256-fzwVxbn4+5zkcAKQ9+bEbNSdwcPKZqsNIJZPqhV+n8w=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    botocore
    jmespath
    s3transfer
  ];

  optional-dependencies = {
    crt = botocore.optional-dependencies.crt;
  };

  pythonImportsCheck = [ "boto3" ];

  meta = {
    description = "AWS SDK for Python";
    homepage = "https://github.com/boto/boto3";
    license = lib.licenses.asl20;
    longDescription = ''
      Boto3 is the Amazon Web Services (AWS) Software Development Kit (SDK) for
      Python, which allows Python developers to write software that makes use of
      services like Amazon S3 and Amazon EC2.
    '';
  };
})
