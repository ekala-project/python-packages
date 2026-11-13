{
  buildPythonPackage,
  opentelemetry-instrumentation,

  # build-system
  hatchling,

  # dependencies
  opentelemetry-api,
  opentelemetry-semantic-conventions,
  opentelemetry-util-http,
  wrapt,

  # optional-dependencies
  urllib3,

  # tests
  httpretty,
  opentelemetry-test-utils,
  respx,
}:

buildPythonPackage rec {
  inherit (opentelemetry-instrumentation) version src;
  pname = "opentelemetry-instrumentation-urllib3";
  pyproject = true;

  sourceRoot = "${opentelemetry-instrumentation.src.name}/instrumentation/opentelemetry-instrumentation-urllib3";

  build-system = [ hatchling ];

  pythonRelaxDeps = [
    "opentelemetry-semantic-conventions"
    "wrapt"
  ];

  dependencies = [
    opentelemetry-api
    opentelemetry-instrumentation
    opentelemetry-semantic-conventions
    wrapt
    opentelemetry-util-http
  ];

  optional-dependencies = {
    instruments = [
      urllib3
    ];
  };

  # the module imports the instrumented library, so pythonImportsCheck needs it
  nativeBuildInputs = optional-dependencies.instruments;

  pythonImportsCheck = [ "opentelemetry.instrumentation.urllib3" ];
  meta = opentelemetry-instrumentation.meta // {
    description = "OpenTelemetry urllib3 instrumentation";
    homepage = "https://github.com/open-telemetry/opentelemetry-python-contrib/blob/main/instrumentation/opentelemetry-instrumentation-urllib3";
  };
}
