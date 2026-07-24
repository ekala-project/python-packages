{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  django,
}:

buildPythonPackage rec {
  pname = "django-extensions";
  version = "4.1";
  pyproject = true;

  src = fetchPypi {
    pname = "django_extensions";
    inherit version;
    hash = "sha256-e3Ck0o6bhA9EaU4/f+tU9V1JX4s/psXA5eEryyqjzes=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];

  pythonImportsCheck = [ "django_extensions" ];

  meta = {
    description = "Collection of custom extensions for the Django Framework";
    homepage = "https://github.com/django-extensions/django-extensions";
    license = lib.licenses.mit;
  };
}
