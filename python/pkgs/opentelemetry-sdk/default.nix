{
  buildPythonPackage,
  hatchling,
  opentelemetry-api,
  opentelemetry-semantic-conventions,
  typing-extensions,
}:

buildPythonPackage {
  inherit (opentelemetry-api) version src;
  pname = "opentelemetry-sdk";
  pyproject = true;

  sourceRoot = "${opentelemetry-api.src.name}/opentelemetry-sdk";

  build-system = [ hatchling ];

  dependencies = [
    opentelemetry-api
    opentelemetry-semantic-conventions
    typing-extensions
  ];

  pythonImportsCheck = [ "opentelemetry.sdk" ];

  doCheck = false;

  meta = opentelemetry-api.meta // {
    homepage = "https://github.com/open-telemetry/opentelemetry-python/tree/main/opentelemetry-sdk";
    description = "OpenTelemetry Python SDK";
  };
}
