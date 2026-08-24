{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  hatchling,
  # dependencies
  anyio,
  pycrdt,
  pycrdt-store,
  sqlite-anyio,
  # optional-dependencies
  channels,
}:

buildPythonPackage (finalAttrs: {
  pname = "pycrdt-websocket";
  version = "0.16.4";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "y-crdt";
    repo = "pycrdt-websocket";
    tag = finalAttrs.version;
    hash = "sha256-H9QxMxNCIvykGpdxNAtAbVpaJlpnq9O76nTh1raVfJU=";
  };

  build-system = [ hatchling ];

  dependencies = [
    anyio
    pycrdt
    pycrdt-store
    sqlite-anyio
  ];

  optional-dependencies = {
    django = [ channels ];
  };

  pythonImportsCheck = [ "pycrdt.websocket" ];

  meta = {
    description = "WebSocket Connector for pycrdt";
    homepage = "https://github.com/jupyter-server/pycrdt-websocket";
    license = lib.licenses.mit;
    teams = [ lib.teams.jupyter ];
  };
})
