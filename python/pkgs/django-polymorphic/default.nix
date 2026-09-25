{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  django,
  dj-database-url,
  django-test-migrations,
  pytest-cov-stub,
  pytest-django,
  pytest-playwright ? null,
}:

buildPythonPackage rec {
  pname = "django-polymorphic";
  version = "4.11.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-polymorphic";
    repo = "django-polymorphic";
    tag = "v${version}";
    hash = "sha256-Xm+yPpi6UbHON2eSv1e8hiQLWHdMA4zYoDtAnURFMRA=";
  };

  build-system = [ hatchling ];

  dependencies = [ django ];
  pythonImportsCheck = [ "polymorphic" ];

  meta = {
    homepage = "https://github.com/django-polymorphic/django-polymorphic";
    description = "Improved Django model inheritance with automatic downcasting";
    license = lib.licenses.bsd3;
  };
}
