{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  django
, django-stubs-ext
, typing-extensions
, # optional-dependencies
  mysqlclient
, psycopg
,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-tasks";
  version = "0.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "RealOrangeOne";
    repo = "django-tasks";
    tag = finalAttrs.version;
    hash = "sha256-pAVpsQXoiqneQaXrHNbBW7LumyYeJ4/9b0dg2qx7LZo=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    django
    django-stubs-ext
    typing-extensions
  ];

  optional-dependencies = {
    mysql = [
      mysqlclient
    ];
    postgres = [
      psycopg
    ];
  };

  pythonImportsCheck = [ "django_tasks" ];

  # redis hook does not support darwin
  meta = {
    description = "Reference implementation and backport of background workers and tasks in Django";
    homepage = "https://github.com/RealOrangeOne/django-tasks";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
