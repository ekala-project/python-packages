{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,

  # build-system
  setuptools,

  # dependencies
  django,

  # optional-dependencies
  coreapi,
  coreschema,
  django-guardian,
  inflection,
  psycopg2,
  pygments,
  pyyaml,

  # tests
  pytest-django,
  pytz,
}:

buildPythonPackage (finalAttrs: {
  pname = "djangorestframework";
  version = "3.17.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "encode";
    repo = "django-rest-framework";
    tag = finalAttrs.version;
    hash = "sha256-hDAtICtVFeEXRgR5Shb0IdVlLkpf/TBDWw+2cOLJTfw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
  ];

  optional-dependencies = {
    complete = [
      coreapi
      coreschema
      django-guardian
      inflection
      psycopg2
      pygments
      pyyaml
    ];
  };
  pythonImportsCheck = [ "rest_framework" ];

  meta = {
    description = "Web APIs for Django, made easy";
    homepage = "https://www.django-rest-framework.org/";
    license = lib.licenses.bsd2;
  };
})
