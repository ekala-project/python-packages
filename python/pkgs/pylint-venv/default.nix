{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "pylint_venv";
  version = "3.0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-THHCrRT8BUlplEC8xGCZT/3cFIG5B4QEtMQ9KAbvD1k=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "pylint_venv" ];

  meta = {
    description = "Module to make pylint respect virtual environments";
    homepage = "https://github.com/jgosmann/pylint-venv/";
    license = lib.licenses.mit;
  };
}
