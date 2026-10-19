{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "configargparse";
  version = "1.7.7";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-YHvqJ2ohmRIVivoeWnFsP4+I1UL5mX39Q7vQtJKp9aY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "configargparse" ];

  meta = {
    homepage = "https://github.com/bw2/ConfigArgParse";
    description = "Drop-in replacement for argparse";
    license = lib.licenses.mit;
  };
})
