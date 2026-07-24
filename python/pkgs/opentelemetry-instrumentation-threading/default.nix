{
  buildPythonPackage,
  hatchling,
  opentelemetry-api,
  opentelemetry-instrumentation,
  wrapt,
}:

buildPythonPackage {
  inherit (opentelemetry-instrumentation) version src;
  pname = "opentelemetry-instrumentation-threading";
  pyproject = true;

  sourceRoot = "${opentelemetry-instrumentation.src.name}/instrumentation/opentelemetry-instrumentation-threading";

  build-system = [ hatchling ];

  pythonRelaxDeps = [ "wrapt" ];

  dependencies = [
    opentelemetry-api
    opentelemetry-instrumentation
    wrapt
  ];

  pythonImportsCheck = [ "opentelemetry.instrumentation.threading" ];

  meta = opentelemetry-instrumentation.meta // {
    description = "Thread context propagation support for OpenTelemetry";
    homepage = "https://github.com/open-telemetry/opentelemetry-python-contrib/blob/main/instrumentation/opentelemetry-instrumentation-threading";
  };
}
