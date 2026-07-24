{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  nix-update-script,
  pytest-asyncio,
}:

buildPythonPackage (finalAttrs: {
  pname = "openinference-semantic-conventions";
  version = "0.1.30";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "Arize-ai";
    repo = "openinference";
    tag = "python-openinference-semantic-conventions-v${finalAttrs.version}";
    hash = "sha256-MkgajZknHOw4/qra6uZ99rtpiylpHhOj8tDfLGUSU74=";
  };

  sourceRoot = "${finalAttrs.src.name}/python/${finalAttrs.pname}";

  build-system = [ hatchling ];
  pythonImportsCheck = [ "openinference.semconv" ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "OpenTelemetry Semantic Conventions for AI Observability";
    homepage = "https://github.com/Arize-ai/openinference";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
