{ lib
, buildPythonPackage
, fetchFromGitHub
, hatchling
, anyio
,
}:

buildPythonPackage rec {
  pname = "sqlite-anyio";
  version = "0.2.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "davidbrochart";
    repo = "sqlite-anyio";
    tag = "v${version}";
    hash = "sha256-1riZiLBccg7Vqq+a8xT5Lr4vxjkeMbf1wqXnTTgY8iY=";
  };

  build-system = [ hatchling ];

  dependencies = [ anyio ];

  pythonImportsCheck = [ "sqlite_anyio" ];

  meta = {
    description = "Asynchronous client for SQLite using AnyIO";
    homepage = "https://github.com/davidbrochart/sqlite-anyio";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
