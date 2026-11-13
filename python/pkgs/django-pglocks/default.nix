{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  hatchling,
  # dependencies
  django,
  django-pgware,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-pglocks";
  version = "2.1.0";
  pyproject = true;

  meta = {
    description = "PostgreSQL locking context managers and functions for Django";
    homepage = "https://github.com/Xof/django-pglocks";
    license = lib.licenses.mit;
  };

  src = fetchPypi {
    pname = "django_pglocks";
    inherit (finalAttrs) version;
    hash = "sha256-o9VSaC3FDJKnvQ/l8Cbj6Il1gIXQiUowH+RDfFfJ1k8=";
  };

  build-system = [ hatchling ];

  dependencies = [
    django
    django-pgware
  ];

  # tests need a postgres database
})
