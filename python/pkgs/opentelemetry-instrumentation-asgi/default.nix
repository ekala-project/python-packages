{
  buildPythonPackage,
  asgiref,
  hatchling,
  opentelemetry-api,
  opentelemetry-instrumentation,
  opentelemetry-semantic-conventions,
  opentelemetry-util-http,
}:

buildPythonPackage {
  inherit (opentelemetry-instrumentation) version src;
  pname = "opentelemetry-instrumentation-asgi";
  pyproject = true;

  sourceRoot = "${opentelemetry-instrumentation.src.name}/instrumentation/opentelemetry-instrumentation-asgi";

  build-system = [ hatchling ];

  pythonRelaxDeps = [ "opentelemetry-semantic-conventions" ];

  dependencies = [
    asgiref
    opentelemetry-instrumentation
    opentelemetry-api
    opentelemetry-semantic-conventions
    opentelemetry-util-http
  ];

  doCheck = false;

  pythonImportsCheck = [ "opentelemetry.instrumentation.asgi" ];

  meta = opentelemetry-instrumentation.meta // {
    homepage = "https://github.com/open-telemetry/opentelemetry-python-contrib/blob/main/instrumentation/opentelemetry-instrumentation-asgi";
    description = "ASGI instrumentation for OpenTelemetry";
  };
}
