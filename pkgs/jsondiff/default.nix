{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "jsondiff";
  version = "2.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ZY0WLIqGuobeJjA82Gp7N+GyweyYtWmmDiymGAVF9/4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ pyyaml ];

  pythonImportsCheck = [ "jsondiff" ];

  meta = {
    homepage = "https://github.com/xlwings/jsondiff";
    description = "Diff JSON and JSON-like structures in Python";
    license = lib.licenses.mit;
  };
}
