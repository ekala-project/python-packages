{
  buildPythonPackage,

  # build-system
  hatchling,

  # dependencies
  opentelemetry-api,
  opentelemetry-instrumentation,
  opentelemetry-semantic-conventions,
  packaging,
  sqlalchemy,
  wrapt,

  # tests
  opentelemetry-test-utils,
}:

buildPythonPackage {
  inherit (opentelemetry-instrumentation) version src;
  pname = "opentelemetry-instrumentation-sqlalchemy";
  pyproject = true;

  sourceRoot = "${opentelemetry-instrumentation.src.name}/instrumentation/opentelemetry-instrumentation-sqlalchemy";

  build-system = [ hatchling ];

  dependencies = [
    opentelemetry-api
    opentelemetry-instrumentation
    opentelemetry-semantic-conventions
    packaging
    sqlalchemy
    wrapt
  ];
  pythonImportsCheck = [ "opentelemetry.instrumentation.sqlalchemy" ];

  meta = opentelemetry-instrumentation.meta // {
    homepage = "https://github.com/open-telemetry/opentelemetry-python-contrib/tree/main/instrumentation/opentelemetry-instrumentation-sqlalchemy";
    description = "SQLAlchemy instrumentation for OpenTelemetry";
  };
}
