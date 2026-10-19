{
  lib,
  buildPythonPackage,
  requests,
  six,
  websocket-client,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "socketio-client";
  version = "0.7.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "invisibleroads";
    repo = "socketio-client";
    tag = version;
    hash = "sha256-71sjiGJDDYElPGUNCH1HaVdvgMt8KeD/kXVDpF615ho=";
  };

  build-system = [ setuptools ];

  dependencies = [
    six
    websocket-client
    requests
  ];

  # Perform networking tests.

  pythonImportsCheck = [ "socketIO_client" ];

  meta = {
    description = "Socket.io client library for protocol 1.x";
    homepage = "https://github.com/invisibleroads/socketIO-client";
    license = lib.licenses.mit;
  };
}
