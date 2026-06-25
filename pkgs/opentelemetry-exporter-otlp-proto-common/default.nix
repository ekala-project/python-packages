{
  buildPythonPackage,
  hatchling,
  opentelemetry-api,
  opentelemetry-proto,
}:

buildPythonPackage {
  inherit (opentelemetry-api) version src;
  pname = "opentelemetry-exporter-otlp-proto-common";
  pyproject = true;

  sourceRoot = "${opentelemetry-api.src.name}/exporter/opentelemetry-exporter-otlp-proto-common";

  build-system = [ hatchling ];

  dependencies = [ opentelemetry-proto ];

  pythonImportsCheck = [ "opentelemetry.exporter.otlp.proto.common" ];

  meta = opentelemetry-api.meta // {
    homepage = "https://github.com/open-telemetry/opentelemetry-python/tree/main/exporter/opentelemetry-exporter-otlp-proto-common";
    description = "OpenTelemetry Protobuf encoding";
  };
}
