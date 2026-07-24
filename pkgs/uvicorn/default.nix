{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  click,
  h11,
  httptools,
  python-dotenv,
  pyyaml,
  uvloop,
  watchfiles,
  websockets,
  hatchling,
}:

buildPythonPackage rec {
  pname = "uvicorn";
  version = "0.51.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "encode";
    repo = "uvicorn";
    tag = version;
    hash = "sha256-VX5X2BY8eZc93r3zfJFhtz1vuXHvaqWB5rTj7zddSzU=";
  };

  build-system = [ hatchling ];

  dependencies = [
    click
    h11
  ];

  optional-dependencies.standard = [
    httptools
    python-dotenv
    pyyaml
    uvloop
    watchfiles
    websockets
  ];

  pythonImportsCheck = [ "uvicorn" ];

  meta = {
    homepage = "https://www.uvicorn.org/";
    description = "Lightning-fast ASGI server";
    mainProgram = "uvicorn";
    license = lib.licenses.bsd3;
  };
}
