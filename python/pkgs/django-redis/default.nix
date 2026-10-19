{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,

  # dependencies
  django,
  redis,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-redis";
  version = "7.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jazzband";
    repo = "django-redis";
    tag = finalAttrs.version;
    hash = "sha256-4YNhNsa0J1tTtaeJTHnwT8WwYs6QQuxnjVl1mAYNePI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    redis
  ];

  optional-dependencies = {
    hiredis = [ redis ] ++ redis.optional-dependencies.hiredis;
  };

  pythonImportsCheck = [ "django_redis" ];

  meta = {
    description = "Full featured redis cache backend for Django";
    homepage = "https://github.com/jazzband/django-redis";
    license = lib.licenses.bsd3;
  };
})
