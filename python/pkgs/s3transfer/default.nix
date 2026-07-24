{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  botocore,
}:

buildPythonPackage rec {
  pname = "s3transfer";
  version = "0.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "boto";
    repo = "s3transfer";
    tag = version;
    hash = "sha256-dpDlsZtLjd6r4kLkIDPG6ZPFFs6/4elYiHk2HDpa9+4=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    botocore
  ];

  pythonImportsCheck = [ "s3transfer" ];

  meta = {
    description = "Library for managing Amazon S3 transfers";
    homepage = "https://github.com/boto/s3transfer";
    license = lib.licenses.asl20;
  };
}
