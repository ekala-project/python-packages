{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  hatch-jupyter-builder,
  hatchling,
  argon2-cffi,
  jinja2,
  tornado,
  pyzmq,
  traitlets,
  jupyter-core,
  jupyter-client,
  jupyter-events,
  jupyter-server-terminals,
  nbformat,
  nbconvert,
  packaging,
  send2trash,
  terminado,
  prometheus-client,
  anyio,
  websocket-client,
  overrides,
}:

buildPythonPackage rec {
  pname = "jupyter-server";
  version = "2.20.0";
  pyproject = true;

  src = fetchPypi {
    pname = "jupyter_server";
    inherit version;
    hash = "sha256-tXeLozfYAVo9wrgIA+zdWsGNN5f932GlDqX7RytOvhQ=";
  };

  build-system = [
    hatch-jupyter-builder
    hatchling
  ];

  dependencies = [
    argon2-cffi
    jinja2
    tornado
    pyzmq
    traitlets
    jupyter-core
    jupyter-client
    jupyter-events
    jupyter-server-terminals
    nbformat
    nbconvert
    packaging
    send2trash
    terminado
    prometheus-client
    anyio
    websocket-client
    overrides
  ];

  # https://github.com/NixOS/nixpkgs/issues/299427
  stripExclude = lib.optionals stdenv.hostPlatform.isDarwin [ "favicon.ico" ];

  pythonImportsCheck = [ "jupyter_server" ];

  meta = {
    description = "Backend—i.e. core services, APIs, and REST endpoints—to Jupyter web applications";
    mainProgram = "jupyter-server";
    homepage = "https://github.com/jupyter-server/jupyter_server";
    license = lib.licenses.bsdOriginal;
    maintainers = [ ];
  };
}
