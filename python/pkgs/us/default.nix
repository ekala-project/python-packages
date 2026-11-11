{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  jellyfish,
}:

buildPythonPackage (finalAttrs: {
  pname = "us";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-fdTE5gPJQnty1+B75wDY9kO9zX9RlaErxjnxt+OOdJY=";
  };

  build-system = [ setuptools ];

  dependencies = [ jellyfish ];

  pythonImportsCheck = [ "us" ];

  meta = {
    description = "Package for easily working with US and state metadata";
    homepage = "https://github.com/unitedstates/python-us/";
    license = lib.licenses.bsd3;
  };
})
