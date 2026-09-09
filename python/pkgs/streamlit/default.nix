{
  lib,
  stdenv,
  altair,
  anyio,
  blinker,
  buildPythonPackage,
  cachetools,
  click,
  fetchPypi,
  gitpython,
  httptools,
  itsdangerous,
  numpy,
  packaging,
  pandas,
  pillow,
  protobuf,
  pyarrow,
  pydeck,
  python-multipart,
  requests,
  rich,
  setuptools,
  starlette,
  tenacity,
  toml,
  tornado,
  typing-extensions,
  uvicorn,
  watchdog,
  websockets,
}:

buildPythonPackage (finalAttrs: {
  pname = "streamlit";
  version = "1.63.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-HqASGITVYGzwVbjEJgBSja8H0EAeqr/I4i8A4jXqU+s=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "packaging"
    "protobuf"
  ];

  dependencies = [
    altair
    anyio
    blinker
    cachetools
    click
    gitpython
    httptools
    itsdangerous
    numpy
    packaging
    pandas
    pillow
    protobuf
    pyarrow
    pydeck
    python-multipart
    requests
    rich
    starlette
    tenacity
    toml
    tornado
    typing-extensions
    uvicorn
    websockets
  ]
  ++ lib.optionals (!stdenv.hostPlatform.isDarwin) [ watchdog ];

  # pypi package does not include the tests, but cannot be built with fetchFromGitHub
  pythonImportsCheck = [ "streamlit" ];

  meta = {
    homepage = "https://streamlit.io/";
    description = "Fastest way to build custom ML tools";
    mainProgram = "streamlit";
    maintainers = [ ];
    license = lib.licenses.asl20;
  };
})
