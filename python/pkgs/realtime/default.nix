{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pydantic,
  pytest-asyncio,
  pytest-cov-stub,
  python-dotenv,
  typing-extensions,
  websockets,
}:

buildPythonPackage (finalAttrs: {
  pname = "realtime";
  version = "2.29.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "supabase";
    repo = "supabase-py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-LaSlAYFvx/HHdfmc9J+KScVQ9JFGS98Yfihzn8F7t3g=";
  };

  sourceRoot = "${finalAttrs.src.name}/src/realtime";

  pythonRelaxDeps = [ "websockets" ];

  build-system = [ poetry-core ];

  dependencies = [
    pydantic
    typing-extensions
    websockets
  ];
  pythonImportsCheck = [ "realtime" ];
  meta = {
    description = "Client library for Supabase Functions";
    homepage = "https://github.com/supabase/supabase-py";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
