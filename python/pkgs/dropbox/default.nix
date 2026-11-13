{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  requests,
  stone,
}:

buildPythonPackage (finalAttrs: {
  pname = "dropbox";
  version = "12.2.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-57hJVV4oZeswb5C66NXAnb4NkliFIyZg2S0L6iaeIA0=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    requests
    stone
  ];

  pythonImportsCheck = [ "dropbox" ];

  meta = {
    homepage = "https://github.com/dropbox/dropbox-sdk-python";
    description = "Python library for Dropbox's HTTP-based Core and Datastore APIs";
    license = lib.licenses.mit;
  };
})
