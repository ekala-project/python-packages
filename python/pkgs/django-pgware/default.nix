{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  hatchling,
  # dependencies
  django,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-pgware";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "django_pgware";
    inherit (finalAttrs) version;
    hash = "sha256-56pwWGGIG/XH9KlVIgBRBJyGBFpWwcOTP0T8QRxEfuY=";
  };

  build-system = [ hatchling ];

  dependencies = [ django ];

  # tests need a postgres database
  pythonImportsCheck = [ "django_pg_utils" ];

  meta = {
    description = "PostgreSQL utilities for Django: advisory locks, GUC management, and logging suppression";
    homepage = "https://github.com/Xof/django-pgware";
    license = lib.licenses.postgresql;
  };
})
