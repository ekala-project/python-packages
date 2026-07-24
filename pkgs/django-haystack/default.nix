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
  version = "3.4.0";
  pyproject = true;

  src = fetchPypi {
    pname = "django_haystack";
    inherit version;
    hash = "sha256-Eianyc4T4efq2KyD9uh7/vSZbxRu0klx/eeJYRWxxTA=";
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
