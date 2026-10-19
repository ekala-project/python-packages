{
  lib,
  anyio,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-fancy-pypi-readme,
  hatchling,
  trio,
}:

buildPythonPackage (finalAttrs: {
  pname = "anysqlite";
  version = "0.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "karpetrosyan";
    repo = "anysqlite";
    tag = "v${finalAttrs.version}";
    hash = "sha256-6kNN6kjkMHVNneMq/8zQxqMIXUxH/+eWLX8XhoHqFRU=";
  };

  nativeBuildInputs = [
    hatch-fancy-pypi-readme
    hatchling
  ];

  dependencies = [ anyio ];
  pythonImportsCheck = [ "anysqlite" ];

  meta = {
    description = "Sqlite3 for asyncio and trio";
    homepage = "https://github.com/karpetrosyan/anysqlite";
    license = lib.licenses.bsd3;
  };
})
