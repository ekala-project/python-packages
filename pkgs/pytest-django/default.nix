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
  version = "4.11.1";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_django";
    inherit version;
    hash = "sha256-qUkUGh7hA8sOeiDxRR01X4P15KXQe91Nz90f0P8ieZE=";
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
