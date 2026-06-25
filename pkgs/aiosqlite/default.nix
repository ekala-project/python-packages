{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "aiosqlite";
  version = "0.21.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "omnilib";
    repo = "aiosqlite";
    tag = "v${version}";
    hash = "sha256-3l/uR97WuLlkAEdogL9iYoXp89bsAcpH6XEtMELsX9o=";
  };

  build-system = [ flit-core ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "aiosqlite" ];

  meta = {
    description = "Asyncio bridge to the standard sqlite3 module";
    homepage = "https://github.com/jreese/aiosqlite";
    license = lib.licenses.mit;
  };
}
