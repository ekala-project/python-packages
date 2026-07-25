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
  version = "2.16.1";
  pyproject = true;
  __structuredAttrs = true;

  # pypi doesn't include tests but there aren't any upstream git tags
  src = fetchFromGitHub {
    owner = "exa-labs";
    repo = "exa-py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-zMQAPJnIHA7PiHCoPf0/iPrTEsctnM8cQBY2fVpDpjo=";
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
    maintainers = [ ];
    license = lib.licenses.mit;
  };
})
