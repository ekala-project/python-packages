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
  version = "4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rq";
    repo = "django-rq";
    tag = "v${finalAttrs.version}";
    hash = "sha256-sd1qPPjr4MmS/74OIlmfNCVAJIVXLFC71cwn18n/wNk=";
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
  };
})
