{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  cffi,
}:

buildPythonPackage rec {
  pname = "milksnake";
  version = "0.1.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AZj4kytOE2wpwNDUkP8brAP4LDp7Lub2ZuNoO2QxT9k=";
  };

  build-system = [ setuptools ];

  dependencies = [ cffi ];

  pythonImportsCheck = [ "milksnake" ];

  meta = {
    homepage = "https://github.com/getsentry/milksnake";
    description = "Python library that extends setuptools for binary extensions";
    license = lib.licenses.asl20;
  };
}
