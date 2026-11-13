{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  wheel,
}:

buildPythonPackage (finalAttrs: {
  pname = "tqdm";
  version = "4.70.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-zv0OyhGyo3o67ndlRNT0rpE/AmiBNbVVa4eI36R0r8Q=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
    wheel
  ];

  pythonImportsCheck = [ "tqdm" ];

  meta = {
    description = "Fast, Extensible Progress Meter";
    mainProgram = "tqdm";
    homepage = "https://github.com/tqdm/tqdm";
    license = lib.licenses.mit;
  };
})
