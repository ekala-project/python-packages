{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  trio,
  wsproto,
}:

buildPythonPackage rec {
  pname = "trio-websocket";
  version = "0.12.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "HyperionGray";
    repo = "trio-websocket";
    rev = version;
    hash = "sha256-TGFf4WUeZDrjp/UiQ9O/GoaK5BRC2aaGZVPfqZ4Ip9I=";
  };

  build-system = [ setuptools ];

  dependencies = [
    trio
    wsproto
  ];

  pythonImportsCheck = [ "trio_websocket" ];

  meta = {
    description = "WebSocket library for Trio";
    homepage = "https://github.com/HyperionGray/trio-websocket";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
