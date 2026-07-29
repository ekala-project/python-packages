{
  lib,
  buildPythonPackage,
  django,
  django-redis,
  fetchFromGitHub,
  pymemcache,
  setuptools,
}:

buildPythonPackage rec {
  pname = "django-ratelimit";
  version = "4.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jsocol";
    repo = "django-ratelimit";
    tag = "v${version}";
    hash = "sha256-ZMtZSKOIIRSqH6eyC7bBeua7YLKyWW6NOXN/MDv9fy4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    django-redis
    pymemcache
  ];

  pythonImportsCheck = [
    "django_ratelimit"
  ];

  meta = {
    description = "Cache-based rate-limiting for Django";
    homepage = "https://github.com/jsocol/django-ratelimit";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
