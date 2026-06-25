{
  buildPythonPackage,
  hatchling,
  opentelemetry-api,
  opentelemetry-exporter-otlp-proto-grpc,
  opentelemetry-exporter-otlp-proto-http,
}:

buildPythonPackage {
  inherit (opentelemetry-api) version src;
  pname = "opentelemetry-exporter-otlp";
  pyproject = true;

  sourceRoot = "${opentelemetry-api.src.name}/exporter/opentelemetry-exporter-otlp";

  build-system = [ hatchling ];

  dependencies = [
    opentelemetry-exporter-otlp-proto-grpc
    opentelemetry-exporter-otlp-proto-http
  ];

  pythonImportsCheck = [ "opentelemetry.exporter.otlp" ];

  meta = opentelemetry-api.meta // {
    homepage = "https://github.com/open-telemetry/opentelemetry-python/tree/main/exporter/opentelemetry-exporter-otlp";
    description = "OpenTelemetry Collector Exporters";
  };
}
