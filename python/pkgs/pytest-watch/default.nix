{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  colorama,
  docopt,
  pytest,
  watchdog,
}:

buildPythonPackage rec {
  pname = "pytest-watch";
  version = "4.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BhNvA9WzYXGLjQ0jQEL3svIDkQ2FaPY98vhmtUez1Lk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    colorama
    docopt
    pytest
    watchdog
  ];

  pythonImportsCheck = [ "pytest_watch" ];

  meta = {
    description = "Local continuous test runner with pytest and watchdog";
    homepage = "https://github.com/joeyespo/pytest-watch";
    license = lib.licenses.mit;
  };
}
