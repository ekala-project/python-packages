{
  buildPythonPackage,
  hatchling,
  opentelemetry-api,
  opentelemetry-instrumentation,
  opentelemetry-semantic-conventions,
  wrapt,
  redis,
  opentelemetry-test-utils,
  fakeredis,
}:

buildPythonPackage rec {
  inherit (opentelemetry-instrumentation) version src;
  pname = "opentelemetry-instrumentation-redis";
  pyproject = true;

  sourceRoot = "${opentelemetry-instrumentation.src.name}/instrumentation/opentelemetry-instrumentation-redis";

  build-system = [ hatchling ];

  pythonRelaxDeps = [ "opentelemetry-semantic-conventions" ];

  dependencies = [
    opentelemetry-api
    opentelemetry-instrumentation
    opentelemetry-semantic-conventions
    wrapt
  ];
  optional-dependencies = {
    instruments = [ redis ];
  };

  # the module imports the instrumented library, so pythonImportsCheck needs it
  nativeBuildInputs = optional-dependencies.instruments;

  pythonImportsCheck = [ "opentelemetry.instrumentation.redis" ];

  meta = opentelemetry-instrumentation.meta // {
    homepage = "https://github.com/open-telemetry/opentelemetry-python-contrib/blob/main/instrumentation/opentelemetry-instrumentation-redis";
    description = "Redis instrumentation for OpenTelemetry";
  };
}
