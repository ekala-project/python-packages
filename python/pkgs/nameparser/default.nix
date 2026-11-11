{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  unittestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "nameparser";
  version = "3.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VWpB1IhLlU6pb8Jm+BvUgirzEycE7lcjjpd8KZld2yM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "nameparser" ];

  meta = {
    description = "Module for parsing human names into their individual components";
    homepage = "https://github.com/derek73/python-nameparser";
    license = lib.licenses.lgpl21Plus;
  };
})
