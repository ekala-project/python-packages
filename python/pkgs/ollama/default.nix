{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-vcs,
  httpx,
  pydantic,
  pillow,
  pytest-asyncio,
  pytest-httpserver,
}:

buildPythonPackage rec {
  pname = "ollama";
  version = "0.6.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ollama";
    repo = "ollama-python";
    tag = "v${version}";
    hash = "sha256-kPFimI9h8BL3qQ+puZy70AYnX3zpbZ2nV5revmYPjIY=";
  };

  pythonRelaxDeps = [ "httpx" ];

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    httpx
    pydantic
  ];
  pythonImportsCheck = [ "ollama" ];
  meta = {
    description = "Ollama Python library";
    homepage = "https://github.com/ollama/ollama-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
