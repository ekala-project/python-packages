{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  bidict,
  python-engineio,
}:

buildPythonPackage rec {
  pname = "python-socketio";
  version = "5.16.3";
  pyproject = true;

  src = fetchPypi {
    pname = "python_socketio";
    inherit version;
    hash = "sha256-ibE29neuZWB6hM7NqbTWxTd7QKl1gsUEwl34mvFtUg4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    bidict
    python-engineio
  ];

  doCheck = false;

  pythonImportsCheck = [ "socketio" ];

  meta = {
    description = "Python Socket.IO server and client";
    homepage = "https://github.com/miguelgrinberg/python-socketio/";
    license = lib.licenses.mit;
  };
}
