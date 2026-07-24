{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  importlib-metadata,
  sqlparse,
  tabulate,
}:

buildPythonPackage rec {
  pname = "yoyo-migrations";
  version = "8.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ggYGoD4mLPHNT1niVsKPpEZCUiTVuCo9EnX9eBeFI+Q=";
  };

  build-system = [ setuptools ];

  dependencies = [
    importlib-metadata
    setuptools
    sqlparse
    tabulate
  ];

  pythonImportsCheck = [ "yoyo" ];

  meta = {
    description = "Database schema migration tool";
    homepage = "https://ollycope.com/software/yoyo";
    license = lib.licenses.asl20;
  };
}
