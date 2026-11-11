{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  google-auth,
  mock,
  proto-plus,
  protobuf,
  pytest-asyncio,
  pytestCheckHook,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-vpc-access";
  version = "1.18.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_vpc_access";
    inherit (finalAttrs) version;
    hash = "sha256-hBWieTmYkPFrF9j35zhJf118zOkZggN7F7mrE7ZbTtE=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    google-auth
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  nativeCheckInputs = [
    mock
    pytest-asyncio
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "google.cloud.vpcaccess"
    "google.cloud.vpcaccess_v1"
  ];

  meta = {
    description = "Python Client for Virtual Private Cloud";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-vpc-access";
    license = lib.licenses.asl20;
  };
})
