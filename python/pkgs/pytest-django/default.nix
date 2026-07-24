{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  pytest,
  django,
}:

buildPythonPackage rec {
  pname = "pytest-django";
  version = "4.12.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_django";
    inherit version;
    hash = "sha256-35TsgZqDyJecj23hPZzfvnbowh05Rzz+K0DJ/Jvjx1g=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  buildInputs = [ pytest ];

  dependencies = [ django ];

  pythonImportsCheck = [ "pytest_django" ];

  meta = {
    description = "Pytest plugin for testing of Django applications";
    homepage = "https://pytest-django.readthedocs.org/en/latest/";
    license = lib.licenses.bsd3;
  };
}
