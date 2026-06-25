{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "typeguard";
  version = "4.4.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-On/S3/twXU0O+u1DBqcEyJud7oULaI8GCosWFaeeX3Q=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    typing-extensions
  ];

  pythonImportsCheck = [ "typeguard" ];

  meta = {
    description = "This library provides run-time type checking for functions defined with argument type annotations";
    homepage = "https://github.com/agronholm/typeguard";
    license = lib.licenses.mit;
  };
}
