{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  django,
  redis,
  rq,
  prometheus-client,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-rq";
  version = "4.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rq";
    repo = "django-rq";
    tag = "v${finalAttrs.version}";
    hash = "sha256-pp8/7pMG4CHEe+jsmZ9euAV8eEMW0Hh4ecTTHnP6DiE=";
  };

  build-system = [ hatchling ];

  dependencies = [
    django
    redis
    rq
  ];

  optional-dependencies = {
    prometheus = [ prometheus-client ];
  };

  # redis hook does not support darwin
  meta = {
    description = "Simple app that provides django integration for RQ (Redis Queue)";
    homepage = "https://github.com/rq/django-rq";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
