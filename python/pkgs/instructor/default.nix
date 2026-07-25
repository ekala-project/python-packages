{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  aiohttp,
  docstring-parser,
  jinja2,
  jiter,
  openai,
  pydantic,
  requests,
  rich,
  tenacity,
  typer,
}:

buildPythonPackage (finalAttrs: {
  pname = "instructor";
  version = "1.15.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jxnl";
    repo = "instructor";
    tag = "v${finalAttrs.version}";
    hash = "sha256-+mYVg4IuoU/GEK/L3qXUfO224eWMrRtoXTTi8RhOJk4=";
  };

  build-system = [ hatchling ];

  pythonRelaxDeps = [
    "jiter"
    "openai"
    "rich"
  ];

  dependencies = [
    aiohttp
    docstring-parser
    jinja2
    jiter
    openai
    pydantic
    requests
    rich
    tenacity
    typer
  ];
  pythonImportsCheck = [ "instructor" ];
  meta = {
    description = "Structured outputs for llm";
    homepage = "https://github.com/jxnl/instructor";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "instructor";
  };
})
