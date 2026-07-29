{
  lib,
  asgiref,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  django,
  django-extensions,
  django-ipware,
  structlog,
  celery,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-structlog";
  version = "10.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jrobichaud";
    repo = "django-structlog";
    tag = finalAttrs.version;
    hash = "sha256-HQxvkArh0WPbVoIoiiSlb2YRk+cJvow/dE/O2JjMlIQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    asgiref
    django
    structlog
    django-ipware
  ];

  optional-dependencies = {
    celery = [ celery ];
    commands = [ django-extensions ];
  };

  pythonImportsCheck = [
    "django_structlog"
  ];

  meta = {
    description = "Structured Logging for Django";
    homepage = "https://github.com/jrobichaud/django-structlog";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
