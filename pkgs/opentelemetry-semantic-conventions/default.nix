{
  buildPythonPackage,
  hatchling,
  opentelemetry-api,
  opentelemetry-instrumentation,
}:

buildPythonPackage {
  inherit (opentelemetry-api) src;
  pname = "opentelemetry-semantic-conventions";
  version = opentelemetry-instrumentation.version;
  pyproject = true;

  sourceRoot = "${opentelemetry-api.src.name}/opentelemetry-semantic-conventions";

  build-system = [ hatchling ];

  dependencies = [ opentelemetry-api ];

  pythonImportsCheck = [ "opentelemetry.semconv" ];

  meta = opentelemetry-api.meta // {
    homepage = "https://github.com/open-telemetry/opentelemetry-python/tree/main/opentelemetry-semantic-conventions";
    description = "OpenTelemetry Semantic Conventions";
  };
}
