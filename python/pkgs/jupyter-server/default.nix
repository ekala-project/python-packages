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

buildPythonPackage (finalAttrs: {
  pname = "jupyter-server";
  version = "2.21.1";
  pyproject = true;

  src = fetchPypi {
    pname = "jupyter_server";
    inherit (finalAttrs) version;
    hash = "sha256-qJYKopJj9gQSg+l9R1awmftJt2e6q2NxiR7LG9QKY98=";
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
  };
})
