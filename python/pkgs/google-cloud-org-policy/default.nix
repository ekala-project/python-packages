{
  lib,
  buildPythonPackage,
  fetchPypi,
  google-api-core,
  proto-plus,
  protobuf,
  pytest-asyncio,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-org-policy";
  version = "1.18.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_org_policy";
    inherit (finalAttrs) version;
    hash = "sha256-QeMwz8gzhj0QprX1/6oqEtD+Lwj6A9YZ+qrXRK6Nkis=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    google-api-core
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;
  # Prevent google directory from shadowing google imports
  pythonImportsCheck = [ "google.cloud.orgpolicy" ];

  meta = {
    description = "Python Client for Organization Policy";
    homepage = "https://github.com/googleapis/google-cloud-python/blob/main/packages/${finalAttrs.pname}";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
