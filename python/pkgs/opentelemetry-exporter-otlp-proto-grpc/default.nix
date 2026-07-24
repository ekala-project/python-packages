{
  buildPythonPackage,
  deprecated,
  googleapis-common-protos,
  grpcio,
  hatchling,
  opentelemetry-api,
  opentelemetry-exporter-otlp-proto-common,
  opentelemetry-proto,
  opentelemetry-sdk,
}:

buildPythonPackage {
  inherit (opentelemetry-api) version src;
  pname = "opentelemetry-exporter-otlp-proto-grpc";
  pyproject = true;

  sourceRoot = "${opentelemetry-api.src.name}/exporter/opentelemetry-exporter-otlp-proto-grpc";

  build-system = [ hatchling ];

  dependencies = [
    deprecated
    googleapis-common-protos
    grpcio
    opentelemetry-api
    opentelemetry-exporter-otlp-proto-common
    opentelemetry-proto
    opentelemetry-sdk
  ];

  pythonImportsCheck = [ "opentelemetry.exporter.otlp.proto.grpc" ];

  meta = opentelemetry-api.meta // {
    homepage = "https://github.com/open-telemetry/opentelemetry-python/tree/main/exporter/opentelemetry-exporter-otlp-proto-grpc";
    description = "OpenTelemetry Collector Protobuf over gRPC Exporter";
  };
}
