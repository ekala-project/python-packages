{
  lib,
  buildPythonPackage,
  cryptography,
  django,
  djangorestframework,
  fetchPypi,
  # build-system
  setuptools,
  pyjwt,
  python-jose,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "djangorestframework-simplejwt";
  version = "5.5.1";
  pyproject = true;

  src = fetchPypi {
    pname = "djangorestframework_simplejwt";
    inherit version;
    hash = "sha256-5yxVcvUdeAMCEojiBXr8vQPxf+EdSECW9ApGCrx26H8=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  dependencies = [
    django
    djangorestframework
    pyjwt
  ];

  optional-dependencies = {
    python-jose = [ python-jose ];
    crypto = [ cryptography ];
  };

  # Test raises django.core.exceptions.ImproperlyConfigured

  pythonImportsCheck = [ "rest_framework_simplejwt" ];

  meta = {
    description = "JSON Web Token authentication plugin for Django REST Framework";
    homepage = "https://github.com/davesque/django-rest-framework-simplejwt";
    license = lib.licenses.mit;
  };
}
