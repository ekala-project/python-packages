{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  django,
  pytz,

  # optional-dependencies
  django-taggit,

  # tests
  pytest-django,
}:

buildPythonPackage rec {
  pname = "django-modelcluster";
  version = "6.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wagtail";
    repo = "django-modelcluster";
    tag = "v${version}";
    hash = "sha256-jIEiwWuC+sudUHsHuG975nxrlC2yKZN/QjdvMKEeL6s=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    pytz
  ];

  optional-dependencies.taggit = [ django-taggit ];

  env.DJANGO_SETTINGS_MODULE = "tests.settings";
  pythonImportsCheck = [ "modelcluster" ];

  meta = {
    description = "Django extension to allow working with 'clusters' of models as a single unit, independently of the database";
    homepage = "https://github.com/torchbox/django-modelcluster/";
    license = lib.licenses.bsd2;
  };
}
