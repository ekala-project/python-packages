{ lib
, arrow
, bson
, buildPythonPackage
, django
, django-picklefield
, fetchFromGitHub
, poetry-core
,
}:

buildPythonPackage rec {
  pname = "django-q2";
  version = "1.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-q2";
    repo = "django-q2";
    tag = "v${version}";
    hash = "sha256-VwB3pvDAGsMvcKblRnmCYHzvEBCz8E13Qov4LjWEqxc=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    arrow
    bson # required for mongodb but undocumented
    django
    django-picklefield
  ];

  pythonImportsCheck = [ "django_q" ];

  env = {
    MONGO_HOST = "127.0.0.1";
    REDIS_HOST = "127.0.0.1";
  };

  meta = {
    description = "Multiprocessing distributed task queue for Django based on Django-Q";
    homepage = "https://github.com/django-q2/django-q2";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
