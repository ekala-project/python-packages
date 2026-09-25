{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  opentelemetry-api,
  opentelemetry-sdk,
  requests,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "opentelemetry-resourcedetector-gcp";
  version = "1.14.0";
  pyproject = true;

  src = fetchPypi {
    pname = "opentelemetry_resourcedetector_gcp";
    inherit version;
    hash = "sha256-ELQYAqz4FYOKhcn+Ha4C9dJ+vBdSe3dEERHAEL6tlbw=";
  };

  build-system = [ hatchling ];

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
  };
}
