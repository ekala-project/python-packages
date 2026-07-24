{
  buildPythonPackage,
  hatchling,
  opentelemetry-api,
  opentelemetry-instrumentation,
  opentelemetry-sdk,
  prometheus-client,
}:

buildPythonPackage {
  inherit (opentelemetry-api) src;
  pname = "opentelemetry-exporter-prometheus";
  version = opentelemetry-instrumentation.version;
  pyproject = true;

  sourceRoot = "${opentelemetry-api.src.name}/exporter/opentelemetry-exporter-prometheus";

  build-system = [ hatchling ];

  dependencies = [
    opentelemetry-api
    opentelemetry-sdk
    prometheus-client
  ];

  pythonImportsCheck = [ "opentelemetry.exporter.prometheus" ];

  meta = opentelemetry-api.meta // {
    homepage = "https://github.com/open-telemetry/opentelemetry-python/tree/main/exporter/opentelemetry-exporter-prometheus";
    description = "Prometheus Metric Exporter for OpenTelemetry";
  };
}
