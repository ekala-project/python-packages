{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  opentelemetry-api,
  opentelemetry-sdk,
  requests,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "opentelemetry-resourcedetector-gcp";
  version = "1.12.0a0";
  pyproject = true;

  src = fetchPypi {
    pname = "opentelemetry_resourcedetector_gcp";
    inherit version;
    hash = "sha256-1eP3goOicuuSVH4Au+/0W3Myo0rnkacKtOuoGvm8O68=";
  };

  build-system = [ setuptools ];

  dependencies = [
    opentelemetry-api
    opentelemetry-sdk
    requests
    typing-extensions
  ];

  pythonImportsCheck = [
    "opentelemetry.resourcedetector.gcp_resource_detector"
  ];

  meta = {
    description = "Google Cloud resource detector for OpenTelemetry";
    homepage = "https://pypi.org/project/opentelemetry-resourcedetector-gcp";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
