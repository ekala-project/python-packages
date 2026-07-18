{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  cherrypy,
  gevent,
  tornado,
}:

buildPythonPackage rec {
  pname = "ws4py";
  version = "0.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-n4exm3c/CgdEo486+jaoAyht0xl/C7Ndm3UpPscALRk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cherrypy
    gevent
    tornado
  ];

  pythonImportsCheck = [ "ws4py" ];

  meta = {
    description = "WebSocket package for Python";
    homepage = "https://ws4py.readthedocs.org";
    license = lib.licenses.bsd3;
  };
}
