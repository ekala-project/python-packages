{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  flake8,
  pydocstyle,
}:

buildPythonPackage rec {
  pname = "flake8-docstrings";
  version = "1.7.0";
  pyproject = true;

  src = fetchPypi {
    pname = "flake8_docstrings";
    inherit version;
    hash = "sha256-TIzHSNwW5oaXKGmeXQ1oXamhCw6nGOCQsboIjmepQa8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    flake8
    pydocstyle
  ];

  doCheck = false;

  pythonImportsCheck = [ "flake8_docstrings" ];

  meta = {
    description = "Extension for flake8 which uses pydocstyle to check docstrings";
    homepage = "https://github.com/pycqa/flake8-docstrings";
    license = lib.licenses.mit;
  };
}
