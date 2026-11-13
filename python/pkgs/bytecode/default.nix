{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "bytecode";
  version = "0.19.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-9ZpqUamAA39kGWRIUE0S+wSTeujcuYCUMmXnma8pQ64=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "bytecode" ];

  meta = {
    description = "Python module to generate and modify bytecode";
    homepage = "https://github.com/vstinner/bytecode";
    license = lib.licenses.mit;
  };
})
