{
  lib,
  stdenv,
  buildPythonPackage,
  celery,
  django,
  fetchFromGitHub,
  flit-core,
  flit-scm,
  pytest-cov-stub,
  pytest-django,
  redis,
  psutil,
  dnspython,
  pytest-asyncio,
  libredirect,
  confluent-kafka,
  aio-pika,
  httpx,
  feedparser,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-health-check";
  version = "4.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "codingjoe";
    repo = "django-health-check";
    tag = finalAttrs.version;
    hash = "sha256-PbimG445XclS7A4SBAZ+9W0WpoerhpqOI4A36Vyqscc=";
  };

  build-system = [
    flit-core
    flit-scm
  ];

  dependencies = [
    django
    dnspython
  ];

  optional-dependencies = {
    psutil = [ psutil ];
    celery = [ celery ];
    kafka = [ confluent-kafka ];
    rabbitmq = [ aio-pika ];
    redis = [ redis ];
    rss = [
      httpx
      feedparser
    ];
    atlassian = [ httpx ];
  };
  pythonImportsCheck = [ "health_check" ];
  preInstallCheck = ''
    export PYTHONPATH=$PWD:$PYTHONPATH
    export DJANGO_SETTINGS_MODULE=tests.testapp.settings
  '';

  meta = {
    description = "Pluggable app that runs a full check on the deployment";
    homepage = "https://github.com/codingjoe/django-health-check";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
