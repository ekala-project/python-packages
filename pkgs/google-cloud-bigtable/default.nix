{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  google-api-core,
  google-cloud-core,
  google-crc32c,
  grpc-google-iam-v1,
  proto-plus,
  protobuf,
  libcst,
}:

buildPythonPackage rec {
  pname = "google-cloud-bigtable";
  version = "2.35.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "python-bigtable";
    tag = "v${version}";
    hash = "sha256-rvw7mHWifJ6+g89DXtV0pOFwbbGQNlK1J+IRhy/7W5o=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    google-cloud-core
    google-crc32c
    grpc-google-iam-v1
    proto-plus
    protobuf
  ] ++ google-api-core.optional-dependencies.grpc;

  optional-dependencies = {
    libcst = [ libcst ];
  };

  pythonImportsCheck = [
    "google.cloud.bigtable_admin_v2"
    "google.cloud.bigtable_v2"
    "google.cloud.bigtable"
  ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Bigtable API client library";
    homepage = "https://github.com/googleapis/python-bigtable";
    license = lib.licenses.asl20;
  };
}
