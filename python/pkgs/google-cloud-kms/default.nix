{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  google-api-core,
  grpc-google-iam-v1,
  proto-plus,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-kms";
  version = "3.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "google-cloud-python";
    tag = "google-cloud-kms-v${version}";
    hash = "sha256-FqlIazChaviPUlTiIyy67/g2i/3r4H/Icj7vVuYkiaU=";
  };

  sourceRoot = "${src.name}/packages/google-cloud-kms";

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "protobuf" ];

  dependencies = [
    grpc-google-iam-v1
    google-api-core
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonImportsCheck = [
    "google.cloud.kms"
    "google.cloud.kms_v1"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Cloud Key Management Service (KMS) API API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-kms";
    license = lib.licenses.asl20;
  };
}
