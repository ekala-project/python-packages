{
  buildPythonPackage,
  fastapi,
  hatchling,
  opentelemetry-api,
  opentelemetry-instrumentation,
  opentelemetry-instrumentation-asgi,
  opentelemetry-semantic-conventions,
  opentelemetry-util-http,
}:

buildPythonPackage {
  inherit (opentelemetry-instrumentation) version src;
  pname = "opentelemetry-instrumentation-fastapi";
  pyproject = true;

  sourceRoot = "${opentelemetry-instrumentation.src.name}/instrumentation/opentelemetry-instrumentation-fastapi";

  build-system = [ hatchling ];

  pythonRelaxDeps = [ "opentelemetry-semantic-conventions" ];

  dependencies = [
    fastapi
    opentelemetry-api
    opentelemetry-instrumentation
    opentelemetry-instrumentation-asgi
    opentelemetry-semantic-conventions
    opentelemetry-util-http
  ];

  pythonImportsCheck = [ "opentelemetry.instrumentation.fastapi" ];

  meta = opentelemetry-instrumentation.meta // {
    description = "OpenTelemetry Instrumentation for fastapi";
    homepage = "https://github.com/open-telemetry/opentelemetry-python-contrib/blob/main/instrumentation/opentelemetry-instrumentation-fastapi";
  };
}
