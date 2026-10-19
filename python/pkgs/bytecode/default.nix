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
  version = "0.19.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-+3M5VzlsuCMB8/ec0yCu8mLNBZLJPWtP1lZ3FQaZliQ=";
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
