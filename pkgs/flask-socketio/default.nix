{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  flask,
  python-socketio,
}:

buildPythonPackage rec {
  pname = "flask-socketio";
  version = "5.6.1";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_socketio";
    inherit version;
    hash = "sha256-/lvZlcPtTampjzNdDYMPoaGdhKZHifYmVkKmcf2srqw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    flask
    python-socketio
  ];

  doCheck = false;

  pythonImportsCheck = [ "flask_socketio" ];

  meta = {
    description = "Socket.IO integration for Flask applications";
    homepage = "https://github.com/miguelgrinberg/Flask-SocketIO/";
    license = lib.licenses.mit;
  };
}
