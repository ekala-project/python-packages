{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  flask,
  python-socketio,
}:

buildPythonPackage (finalAttrs: {
  pname = "flask-socketio";
  version = "5.7.2";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_socketio";
    inherit (finalAttrs) version;
    hash = "sha256-ay+WfyT2k/IxbRCLLSElZC24VrJoHBLmDe2b/xuANeA=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "python-socketio" ];

  dependencies = [
    flask
    python-socketio
  ];

  pythonImportsCheck = [ "flask_socketio" ];

  meta = {
    description = "Socket.IO integration for Flask applications";
    homepage = "https://github.com/miguelgrinberg/Flask-SocketIO/";
    license = lib.licenses.mit;
  };
})
