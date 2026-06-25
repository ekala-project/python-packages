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
  version = "4.67.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+K75xSwIwTpl8w6jT05arD/Ro0lZh51+WeYwJyhmJ/I=";
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
