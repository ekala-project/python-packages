{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  django,
  packaging,
}:

buildPythonPackage rec {
  pname = "django-haystack";
  version = "3.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "django_haystack";
    inherit version;
    hash = "sha256-487ta4AAYl2hTUCetNrGmJSQXirIrBj5v9tZMjygLqs=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    django
    packaging
  ];

  doCheck = false;

  # pythonImportsCheck is not possible because haystack requires Django settings
  # to be configured before any module can be imported

  meta = {
    description = "Pluggable search for Django";
    homepage = "http://haystacksearch.org/";
    license = lib.licenses.bsd3;
  };
}
