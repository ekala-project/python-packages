{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "nlpcloud";
  version = "1.1.47";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-zj6hurPEzNlbrD6trq+zQHBNg4lJMGw+XHV51rBa9Mk=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # upstream has no tests

  pythonImportsCheck = [ "nlpcloud" ];

  meta = {
    description = "Python client for the NLP Cloud API";
    homepage = "https://nlpcloud.com/";
    license = lib.licenses.mit;
  };
})
