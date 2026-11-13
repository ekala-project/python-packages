{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # optional-dependencies
  gevent,
  h2,
  packaging,
  tornado,
  setproctitle,
}:

buildPythonPackage (finalAttrs: {
  pname = "gunicorn";
  version = "27.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "benoitc";
    repo = "gunicorn";
    tag = finalAttrs.version;
    hash = "sha256-X+/Dr95r/ZNEBUHKVM8ezg9QIxcew6AGIfATy5Gb5Ug=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    gevent = [
      gevent
      packaging
    ];
    tornado = [ tornado ];
    gthread = [ ];
    setproctitle = [ setproctitle ];
    http2 = [ h2 ];
  };

  pythonImportsCheck = [ "gunicorn" ];

  meta = {
    description = "WSGI HTTP Server for UNIX, fast clients and sleepy applications";
    homepage = "https://github.com/benoitc/gunicorn";
    license = lib.licenses.mit;
    mainProgram = "gunicorn";
  };
})
