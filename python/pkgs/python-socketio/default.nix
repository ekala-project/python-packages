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
  version = "5.16.4";
  pyproject = true;

  src = fetchPypi {
    pname = "python_socketio";
    inherit (finalAttrs) version;
    hash = "sha256-9/pKQ8yOaHkwtcbkTW4u/CBx7KS+9JuLs9wIJ/f5IjU=";
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
