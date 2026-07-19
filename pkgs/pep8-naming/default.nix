{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  flake8,
}:

buildPythonPackage rec {
  pname = "pep8-naming";
  version = "0.15.1";
  pyproject = true;

  src = fetchPypi {
    pname = "pep8_naming";
    inherit version;
    hash = "sha256-9vSkmaui3u2pPB8mzMAvPaMrA1yLLblpa3MO8sljnSk=";
  };

  build-system = [ setuptools ];

  dependencies = [ flake8 ];

  pythonImportsCheck = [ "pep8ext_naming" ];

  meta = {
    description = "Check PEP-8 naming conventions, plugin for flake8";
    homepage = "https://github.com/PyCQA/pep8-naming";
    license = lib.licenses.mit;
  };
}
