{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "mongoquery";
  version = "1.4.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "sha256-6QH4buWvfvbtovLCb0vSz+g4DYHxeLfjYH27zc7pcjk=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "mongoquery" ];

  meta = {
    description = "Python implementation of mongodb queries";
    homepage = "https://github.com/kapouille/mongoquery";
    license = lib.licenses.unlicense;
  };
})
