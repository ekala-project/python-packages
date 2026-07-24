{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  psutil,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-xprocess";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-FeJwY3WG6rxWdV7l/MgcSL20a6fvfA1bG2QwLQgMxg8=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    psutil
    pytest
  ];

  pythonImportsCheck = [ "xprocess" ];

  meta = {
    description = "Pytest external process plugin";
    homepage = "https://github.com/pytest-dev";
    license = lib.licenses.mit;
  };
}
