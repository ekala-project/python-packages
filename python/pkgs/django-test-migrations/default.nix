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
  version = "1.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wemake-services";
    repo = "django-test-migrations";
    tag = finalAttrs.version;
    hash = "sha256-xct4gtppdzNmmaEs0R37bWoXe92CI9WsRs4adkNKDBE=";
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
  };
})
