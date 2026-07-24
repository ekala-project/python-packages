{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  brotlicffi,
  decorator,
  flasgger,
  flask,
  greenlet,
  six,
  werkzeug,

  # optional-dependencies
  gunicorn,
  gevent,

  # tests
}:

buildPythonPackage rec {
  pname = "httpbin";
  version = "0.10.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YyFIaYJhyGhOotK2JM3qhFtAKx/pFzbonfiGQIxjF6k=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  pythonRelaxDeps = [ "greenlet" ];

  propagatedBuildInputs = [
    brotlicffi
    decorator
    flask
    flasgger
    greenlet
    six
    werkzeug
  ];

  optional-dependencies = {
    mainapp = [
      gunicorn
      gevent
    ];
  };
  pythonImportsCheck = [ "httpbin" ];

  meta = {
    description = "HTTP Request and Response Service";
    homepage = "https://github.com/psf/httpbin";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
