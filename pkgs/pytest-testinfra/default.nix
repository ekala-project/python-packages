{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-testinfra";
  version = "10.2.2";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_testinfra";
    inherit version;
    hash = "sha256-U3/V64jaYYwfRhJIqiBZTPjURRLoUZsjmDfoOHXh6c0=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [ pytest ];

  pythonImportsCheck = [ "testinfra" ];

  meta = {
    description = "Pytest plugin for testing your infrastructure";
    homepage = "https://github.com/pytest-dev/pytest-testinfra";
    license = lib.licenses.asl20;
  };
}
