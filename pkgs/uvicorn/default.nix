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
  version = "0.40.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "encode";
    repo = "uvicorn";
    tag = version;
    hash = "sha256-YpmvMZJxxpMdwbhFQSu+0fo7kcM6w3zJ7jI5LVamV1E=";
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
