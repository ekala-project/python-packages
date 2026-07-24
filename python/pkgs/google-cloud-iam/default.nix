{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  gitUpdater,
  google-api-core,
  google-auth,
  grpc-google-iam-v1,
  libcst,
  mock,
  proto-plus,
  protobuf,
  pytest-asyncio,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-iam";
  version = "2.24.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "google-cloud-python";
    tag = "google-cloud-iam-v${version}";
    hash = "sha256-ywRS1BfK6s+gcU8QRem0cSnfZq4BUQ2ABNcgnOa01LI=";
  };

  sourceRoot = "${src.name}/packages/google-cloud-iam";

  build-system = [ setuptools ];

  dependencies = [
    google-api-core
    google-auth
    grpc-google-iam-v1
    libcst
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonRelaxDeps = [ "protobuf" ];
  pythonImportsCheck = [
    "google.cloud.iam_credentials"
    "google.cloud.iam_credentials_v1"
  ];

  passthru = {
    # bulk updater selects wrong tag
    skipBulkUpdate = true;
    updateScript = gitUpdater {
      rev-prefix = "google-cloud-iam-v";
    };
  };

  meta = {
    description = "IAM Service Account Credentials API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-iam";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
