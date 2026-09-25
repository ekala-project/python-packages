{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build
  poetry-core,

  # deps
  httpcore,
  httpx,
  openai,
  pydantic,
  python-dotenv,
  requests,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "exa-py";
  version = "2.20.0";
  pyproject = true;
  __structuredAttrs = true;

  # pypi doesn't include tests but there aren't any upstream git tags
  src = fetchFromGitHub {
    owner = "exa-labs";
    repo = "exa-py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-oMFpZP3fZ8Gye35U6YQy/urm/07brKt9UicSibudKY4=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    httpcore
    httpx
    openai
    pydantic
    python-dotenv
    requests
    typing-extensions
  ];

  pythonImportsCheck = [
    "exa_py"
  ];
  meta = {
    description = "Official Python SDK for Exa, the web search API for AI";
    homepage = "https://github.com/exa-labs/exa-py/";
    license = lib.licenses.mit;
  };
})
