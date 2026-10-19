{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  gevent,
  gevent-websocket,
  versiontools,
}:

buildPythonPackage (finalAttrs: {
  pname = "gevent-socketio";
  version = "0.3.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-UzlKuT+9hNnbuyvvhTSfalA7/FPYapvoZTJQ8aBBKv8=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ versiontools ];

  buildInputs = [ gevent-websocket ];

  dependencies = [ gevent ];

  # Tests are not ported to Python 3

  pythonImportsCheck = [ "socketio" ];

  meta = {
    description = "SocketIO server based on the Gevent pywsgi server";
    homepage = "https://github.com/abourget/gevent-socketio";
    license = lib.licenses.bsd0;
  };
})
