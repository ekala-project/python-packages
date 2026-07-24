{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "survey";
  version = "5.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4vnjtSbw2y/o+fSWDl/CqTEZkl0jULGOLURdZ0BpKvY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "survey" ];

  meta = {
    description = "Simple library for creating beautiful interactive prompts";
    homepage = "https://github.com/Exahilosys/survey";
    license = lib.licenses.mit;
  };
}
