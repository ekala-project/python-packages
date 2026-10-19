{
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  lib,
  numpy,
}:

buildPythonPackage (finalAttrs: {
  pname = "javaobj-py3";
  version = "0.4.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-5OMlfvLPgaMzl4ek1c+STlTJHwlacj9tJYTa5h1Dlu0=";
  };

  build-system = [ setuptools ];

  dependencies = [ numpy ];

  # Tests assume network connectivity

  pythonImportsCheck = [ "javaobj" ];

  meta = {
    description = "Module for serializing and de-serializing Java objects";
    homepage = "https://github.com/tcalmant/python-javaobj";
    license = lib.licenses.asl20;
  };
})
