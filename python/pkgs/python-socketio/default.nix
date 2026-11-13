{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  bidict,
  python-engineio,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-socketio";
  version = "5.18.1";
  pyproject = true;

  src = fetchPypi {
    pname = "python_socketio";
    inherit (finalAttrs) version;
    hash = "sha256-B6sOfJSlKDOmevHcBZWK1vsN5prch96RmKYbIliMQNQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    bidict
    python-engineio
  ];

  pythonImportsCheck = [ "socketio" ];

  meta = {
    description = "Python Socket.IO server and client";
    homepage = "https://github.com/miguelgrinberg/python-socketio/";
    license = lib.licenses.mit;
  };
})
