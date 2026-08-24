{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  django,
  python-dateutil,
  python,
}:

buildPythonPackage rec {
  pname = "django-auditlog";
  version = "3.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jazzband";
    repo = "django-auditlog";
    tag = "v${version}";
    hash = "sha256-/IOzMGRR8EP/AGP7fcqwP4GeSKXPwE6NF6AZmiF1+lA=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    django
    python-dateutil
  ];

  postgresqlTestUserOptions = "LOGIN SUPERUSER";

  pythonImportsCheck = [ "auditlog" ];

  meta = {
    description = "Django app that keeps a log of changes made to an object";
    homepage = "https://github.com/jazzband/django-auditlog";
    downloadPage = "https://github.com/jazzband/django-auditlog";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
