{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "html5tagger";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hPo9+0nlyDt5u9hWq3sd6OIxHDu0aovpJfEZ44gKjak=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "html5tagger" ];

  meta = {
    description = "Create HTML documents from Python";
    homepage = "https://github.com/sanic-org/html5tagger";
    license = lib.licenses.unlicense;
  };
}
