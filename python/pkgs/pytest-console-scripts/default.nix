{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-console-scripts";
  version = "1.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-WoJu2EzAr6IC655EOB19di973ajgwj+feafx9Ez0qJU=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    pytest
    setuptools
  ];

  pythonImportsCheck = [ "pytest_console_scripts" ];

  meta = {
    description = "Pytest plugin for testing console scripts";
    homepage = "https://github.com/kvas-it/pytest-console-scripts";
    license = lib.licenses.mit;
  };
}
