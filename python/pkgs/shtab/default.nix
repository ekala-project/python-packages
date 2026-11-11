{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "shtab";
  version = "1.13.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Clvp16srRUnpo4JSq81ez17GgT7NgMawb6hRv/VaUIU=";
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
})
