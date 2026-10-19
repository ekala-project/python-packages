{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  docutils,
}:

buildPythonPackage (finalAttrs: {
  pname = "statistics";
  version = "3.4.0b3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-0jSF2WZoBIALeUOXdsFvWxi5bt9WGC7otfLLXHra0MU=";
  };

  build-system = [ setuptools ];

  dependencies = [ docutils ];

  pythonImportsCheck = [ "statistics" ];

  meta = {
    description = "Python 2.* port of 3.4 Statistics Module";
    homepage = "https://github.com/digitalemagine/py-statistics";
    license = lib.licenses.asl20;
  };
})
