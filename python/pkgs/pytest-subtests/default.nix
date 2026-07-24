{
  lib,
  fetchPypi,
  buildPythonPackage,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  attrs,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-subtests";
  version = "0.15.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_subtests";
    inherit version;
    hash = "sha256-y0lb3gVVG3hLjwuK36on7bQTFGmifDObgP2Na6M/iHw=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    attrs
    pytest
  ];

  doCheck = false;

  pythonImportsCheck = [ "pytest_subtests" ];

  meta = {
    description = "Unittest subTest() support and subtests fixture";
    homepage = "https://github.com/pytest-dev/pytest-subtests";
    license = lib.licenses.mit;
  };
}
