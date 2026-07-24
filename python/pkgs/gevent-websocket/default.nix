{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  gevent,
  gunicorn,
}:

buildPythonPackage rec {
  pname = "gevent-websocket";
  version = "0.10.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fq7zKWgpDJEh98Nblz4swwL/sHbQGMkGjS9cqLLYX7A=";
  };

  build-system = [ setuptools ];

  dependencies = [
    gevent
    gunicorn
  ];

  pythonImportsCheck = [ "geventwebsocket" ];

  meta = {
    description = "Websocket handler for the gevent pywsgi server";
    homepage = "https://www.gitlab.com/noppo/gevent-websocket";
    license = lib.licenses.asl20;
  };
}
