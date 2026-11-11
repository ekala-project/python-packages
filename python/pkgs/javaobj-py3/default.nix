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
  version = "0.6.1";
  pyproject = true;

  src = fetchPypi {
    pname = "javaobj_py3";
    inherit (finalAttrs) version;
    hash = "sha256-CI/whsaqKRLzQnVMQ7DKOlBPuGm7Xm8TOVEx6HdE7zw=";
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
