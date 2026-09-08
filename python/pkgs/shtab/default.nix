{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "shtab";
  version = "1.12.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BjczhyOo/AjtHC/YJthDIimSRknCbjJHu0jFPWDKO/k=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "shtab" ];

  meta = {
    description = "Module for shell tab completion of Python CLI applications";
    mainProgram = "shtab";
    homepage = "https://docs.iterative.ai/shtab/";
    license = lib.licenses.asl20;
  };
}
