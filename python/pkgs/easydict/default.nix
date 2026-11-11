{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "easydict";
  version = "1.14";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-BiRWU4GvBgzYeP/9pMQhZPXecjeX8emYoKhmJ3q63LY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "easydict" ];

  meta = {
    description = "Access dict values as attributes (works recursively)";
    homepage = "https://github.com/makinacorpus/easydict";
    license = lib.licenses.lgpl3;
  };
})
