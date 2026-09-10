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
  version = "0.52.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "encode";
    repo = "uvicorn";
    tag = version;
    hash = "sha256-XDhfyL2+L2Dfa01brCgqKibdtkGOI0Xv4Mx0foqHT3A=";
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
