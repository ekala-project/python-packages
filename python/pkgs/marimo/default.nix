{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  uv-build,

  # dependencies
  click,
  docutils,
  itsdangerous,
  jedi,
  loro,
  markdown,
  msgspec,
  narwhals,
  packaging,
  psutil,
  pygments,
  pymdown-extensions,
  python-multipart,
  pyyaml,
  pyzmq,
  starlette,
  tomlkit,
  uvicorn,
  websockets,
}:
buildPythonPackage (finalAttrs: {
  pname = "marimo";
  version = "0.25.2";
  pyproject = true;

  # The github archive does not include the static assets
  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-PPo4rITGZiXh98t9yBpB69WSJEAA/+N+/7KKkXZQVrA=";
  };

  build-system = [ uv-build ];

  pythonRelaxDeps = [
    "jedi"
    "msgspec"
  ];

  dependencies = [
    click
    docutils
    itsdangerous
    jedi
    loro
    markdown
    msgspec
    narwhals
    packaging
    psutil
    pygments
    pymdown-extensions
    python-multipart
    pyyaml
    pyzmq
    starlette
    tomlkit
    uvicorn
    websockets
  ];

  pythonImportsCheck = [ "marimo" ];

  # The pypi archive does not contain tests so we do not use `pytestCheckHook`
  meta = {
    description = "Reactive Python notebook that's reproducible, git-friendly, and deployable as scripts or apps";
    homepage = "https://github.com/marimo-team/marimo";
    license = lib.licenses.asl20;
    mainProgram = "marimo";
  };
})
