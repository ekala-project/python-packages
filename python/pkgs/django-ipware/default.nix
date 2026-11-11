{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  hatchling,
  django,
  python-ipware,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-ipware";
  version = "8.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "django_ipware";
    inherit (finalAttrs) version;
    hash = "sha256-N3zHkm6jd9j1RFEbAZzTKygGDhycqj0MQ8Pl6SNWDzM=";
  };

  build-system = [ hatchling ];

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
