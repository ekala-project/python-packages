{
  lib,
  buildPythonPackage,
  fetchPypi,
  googleapis-common-protos,
  protobuf,
  setuptools,
}:

buildPythonPackage rec {
  pname = "google-cloud-audit-log";
  version = "0.6.0";
  pyproject = true;

  src = fetchPypi {
    pname = "google_cloud_audit_log";
    inherit version;
    hash = "sha256-TdNDaDwLsxGH6+80JoA/ExWelQ++o/5gqGSFXP7ZWbg=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    googleapis-common-protos
    protobuf
  ];

  pythonImportsCheck = [ "google.cloud.audit" ];

  pythonNamespaces = [ "google.cloud" ];

  meta = {
    description = "Google Cloud Audit Protos";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-audit-log";
    license = lib.licenses.asl20;
  };
}
