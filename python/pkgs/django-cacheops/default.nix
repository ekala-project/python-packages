{
  lib,
  buildPythonPackage,
  fetchPypi,
  django,
  funcy,
  redis,
  six,
  setuptools,
}:

buildPythonPackage rec {
  pname = "django-cacheops";
  version = "7.2";
  pyproject = true;

  src = fetchPypi {
    pname = "django_cacheops";
    inherit version;
    hash = "sha256-y8EcwDISlaNkTie8smlA8Iy5wucdPuUGy8/wvdoanzM=";
  };

  pythonRelaxDeps = [ "funcy" ];

  build-system = [ setuptools ];

  dependencies = [
    django
    funcy
    redis
    six
  ];

  env.DJANGO_SETTINGS_MODULE = "tests.settings";

  meta = {
    description = "Slick ORM cache with automatic granular event-driven invalidation for Django";
    homepage = "https://github.com/Suor/django-cacheops";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
