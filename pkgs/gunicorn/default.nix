{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  packaging,

  # optional-dependencies
  gevent,
  tornado,
  setproctitle,
}:

buildPythonPackage rec {
  pname = "gunicorn";
  version = "23.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "benoitc";
    repo = "gunicorn";
    tag = version;
    hash = "sha256-Dq/mrQwo3II6DBvYfD1FHsKHaIlyHlJCZ+ZyrM4Efe0=";
  };

  build-system = [ setuptools ];

  dependencies = [ packaging ];

  optional-dependencies = {
    gevent = [ gevent ];
    tornado = [ tornado ];
    gthread = [ ];
    setproctitle = [ setproctitle ];
  };

  pythonImportsCheck = [ "gunicorn" ];

  meta = {
    description = "WSGI HTTP Server for UNIX, fast clients and sleepy applications";
    homepage = "https://github.com/benoitc/gunicorn";
    license = lib.licenses.mit;
    mainProgram = "gunicorn";
  };
}
