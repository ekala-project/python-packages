{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  colorama,
}:

buildPythonPackage rec {
  pname = "log_symbols";
  version = "0.0.14";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zwu8b+Go5T8NF0pxa8YlxPhwQ8wh61XdinQM/iJoBVY=";
  };

  build-system = [ setuptools ];

  dependencies = [ colorama ];

  pythonImportsCheck = [ "log_symbols" ];

  meta = {
    description = "Colored Symbols for Various Log Levels";
    homepage = "https://github.com/manrajgrover/py-log-symbols";
    license = lib.licenses.mit;
  };
}
