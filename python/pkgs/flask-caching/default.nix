{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  cachelib,
  flask,
}:

buildPythonPackage rec {
  pname = "flask-caching";
  version = "2.5.1";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_caching";
    inherit version;
    hash = "sha256-91tFH94/qsDieNpyJjgYE03sqMS6a7B7mzsjiZE2ja4=";
  };

  build-system = [ flit-core ];

  dependencies = [
    cachelib
    flask
  ];
  meta = {
    description = "Caching extension for Flask";
    homepage = "https://github.com/pallets-eco/flask-caching";
    license = lib.licenses.bsd3;
  };
}
