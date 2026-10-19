{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  django,
  python-ipware,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-ipware";
  version = "7.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-2exD0r983yFv7Y1JSghN61dhpUhgpTsudDRqTzhM/0c=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    python-ipware
  ];

  # django.core.exceptions.ImproperlyConfigured: Requested setting IPWARE_TRUSTED_PROXY_LIST, but settings are not configured. You must either define the environment variable DJANGO_SETTINGS_MODULE or call settings.configure() before accessing settings.

  # pythonImportsCheck fails with:
  # django.core.exceptions.ImproperlyConfigured: Requested setting IPWARE_META_PRECEDENCE_ORDER, but settings are not configured. You must either define the environment variable DJANGO_SETTINGS_MODULE or call settings.configure() before accessing settings.

  meta = {
    description = "Django application to retrieve user's IP address";
    homepage = "https://github.com/un33k/django-ipware";
    license = lib.licenses.mit;
  };
})
