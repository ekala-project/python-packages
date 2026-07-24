{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  jsonschema,
  nix-update-script,
  openai,
  openinference-semantic-conventions,
  opentelemetry-api,
  opentelemetry-sdk,
  pytest-asyncio,
  pytest-vcr,
  typing-extensions,
  wrapt,
}:

buildPythonPackage (finalAttrs: {
  pname = "openinference-instrumentation";
  version = "0.1.54";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "Arize-ai";
    repo = "openinference";
    tag = "python-openinference-instrumentation-v${finalAttrs.version}";
    hash = "sha256-6GWZmgb9ZcT/yx7MvGUQlht5fljQGCKMHMpJWZQKpPI=";
  };

  sourceRoot = "${finalAttrs.src.name}/python/${finalAttrs.pname}";

  build-system = [ hatchling ];

  dependencies = [
    opentelemetry-api
    opentelemetry-sdk
    openinference-semantic-conventions
    typing-extensions
    wrapt
  ];
  pythonImportsCheck = [ "openinference.instrumentation" ];
  passthru.updateScript = nix-update-script { };

  meta = {
    description = "OpenTelemetry Instrumentation for AI Observability";
    homepage = "https://github.com/Arize-ai/openinference";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
