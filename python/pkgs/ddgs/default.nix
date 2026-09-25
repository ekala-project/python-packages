{
  buildPythonPackage,
  click,
  fastapi,
  fetchFromGitHub,
  lib,
  lxml,
  mcp,
  primp,
  setuptools,
  trio,
  uvicorn,
}:

buildPythonPackage (finalAttrs: {
  pname = "ddgs";
  version = "9.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "deedy5";
    repo = "ddgs";
    tag = "v${finalAttrs.version}";
    hash = "sha256-r65Ak4J6W47sQrDfo1KVcBjgavXjvcprggrA0BoEMA0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click
    lxml
    primp
  ];

  optional-dependencies = {
    api = [
      fastapi
      uvicorn
    ];
    mcp = [
      mcp
    ];
    dht = [
      fastapi
      uvicorn
      trio
    ];
  };
  versionCheckProgramArg = "version";

  pythonImportsCheck = [ "ddgs" ];

  meta = {
    description = "A metasearch library that aggregates results from diverse web search services";
    mainProgram = "ddgs";
    homepage = "https://github.com/deedy5/ddgs";
    license = lib.licenses.mit;
  };
})
