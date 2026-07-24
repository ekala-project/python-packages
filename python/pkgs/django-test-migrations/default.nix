{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,

  # dependencies
  typing-extensions,

  # tests
  pytest-cov-stub,
  pytest-django,
  pytest-mock,
  pytest-randomly,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-test-migrations";
  version = "1.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wemake-services";
    repo = "django-test-migrations";
    tag = finalAttrs.version;
    hash = "sha256-mYDGGfkLo+GMgItCje46KtXdPsedawRKXLbRnD+CC+8=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    typing-extensions
  ];
  pythonImportsCheck = [
    "django_test_migrations"
  ];

  meta = {
    description = "Test django schema and data migrations, including migrations' order and best practices";
    homepage = "https://github.com/wemake-services/django-test-migrations";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
