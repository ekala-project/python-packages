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
  version = "4.70.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VbCw29l0YtBuvukeTawk7U1HAr6Csk8H5sHSfgjOoiA=";
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
