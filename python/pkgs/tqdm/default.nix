{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  wheel,
}:

buildPythonPackage rec {
  pname = "tqdm";
  version = "4.69.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cAxehdzV8AndYiJYiikYChk6dIJHpdhVtNZ9uT15pTs=";
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
}
