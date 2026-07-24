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
  pytest-playwright,
}:

buildPythonPackage rec {
  pname = "django-polymorphic";
  version = "4.5.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-polymorphic";
    repo = "django-polymorphic";
    tag = "v${version}";
    hash = "sha256-8MZrQErWWd4GiNaIEnGvj4jONGFzsi3bu5NervF4AnE=";
  };

  build-system = [ hatchling ];

  dependencies = [ django ];
  pythonImportsCheck = [ "polymorphic" ];

  meta = {
    homepage = "https://github.com/django-polymorphic/django-polymorphic";
    description = "Improved Django model inheritance with automatic downcasting";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
