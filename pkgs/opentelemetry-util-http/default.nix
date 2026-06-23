{
  buildPythonPackage,
  hatchling,
  opentelemetry-instrumentation,
}:

buildPythonPackage {
  inherit (opentelemetry-instrumentation) version src;
  pname = "opentelemetry-util-http";
  pyproject = true;

  sourceRoot = "${opentelemetry-instrumentation.src.name}/util/opentelemetry-util-http";

  build-system = [ hatchling ];

  pythonImportsCheck = [ "opentelemetry.util.http" ];

  meta = opentelemetry-instrumentation.meta // {
    homepage = "https://github.com/open-telemetry/opentelemetry-python-contrib/tree/main/util/opentelemetry-util-http";
    description = "Web util for OpenTelemetry";
  };
}
