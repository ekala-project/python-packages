{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  poetry-core
, # dependencies
  aiohttp
, click
, msgpack
, textual
, textual-serve
, typing-extensions
,
}:

buildPythonPackage rec {
  pname = "textual-dev";
  version = "1.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Textualize";
    repo = "textual-dev";
    tag = "v${version}";
    hash = "sha256-0NOFc0FKbVEeZ6rNZGX8lo5W8RU3lKJlH+AqRCifuOE=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    aiohttp
    click
    msgpack
    textual
    textual-serve
    typing-extensions
  ];

  pythonImportsCheck = [ "textual_dev" ];

  meta = {
    description = "Development tools for Textual";
    homepage = "https://github.com/Textualize/textual-dev";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "textual";
  };
}
