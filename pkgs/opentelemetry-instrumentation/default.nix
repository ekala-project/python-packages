{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  opentelemetry-api,
  setuptools,
  wrapt,
}:

buildPythonPackage rec {
  pname = "opentelemetry-instrumentation";
  version = "0.55b0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "open-telemetry";
    repo = "opentelemetry-python-contrib";
    tag = "v${version}";
    hash = "sha256-UM9ezCh3TVwyj257O0rvTCIgfrddobWcVIgJmBUj/Vo=";
  };

  sourceRoot = "${src.name}/opentelemetry-instrumentation";

  build-system = [ hatchling ];

  dependencies = [
    opentelemetry-api
    setuptools
    wrapt
  ];

  pythonImportsCheck = [ "opentelemetry.instrumentation" ];

  meta = {
    description = "Instrumentation Tools & Auto Instrumentation for OpenTelemetry Python";
    homepage = "https://github.com/open-telemetry/opentelemetry-python-contrib/tree/main/opentelemetry-instrumentation";
    license = lib.licenses.asl20;
  };
}
