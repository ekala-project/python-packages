{
  buildPythonPackage,
  hatchling,
  opentelemetry-api,
  protobuf,
}:

buildPythonPackage {
  inherit (opentelemetry-api) version src;
  pname = "opentelemetry-proto";
  pyproject = true;

  sourceRoot = "${opentelemetry-api.src.name}/opentelemetry-proto";

  pythonRelaxDeps = [ "protobuf" ];

  build-system = [ hatchling ];

  dependencies = [ protobuf ];

  pythonImportsCheck = [ "opentelemetry.proto" ];

  meta = opentelemetry-api.meta // {
    homepage = "https://github.com/open-telemetry/opentelemetry-python/tree/main/opentelemetry-proto";
    description = "OpenTelemetry Python Proto";
  };
}
