{
  lib,
  buildPythonPackage,
  celery,
  cron-descriptor,
  django-timezone-field,
  django,
  fakeredis,
  fetchFromGitHub,
  mock,
  python-crontab,
  python-dateutil,
  pytz,
  setuptools,
}:

buildPythonPackage rec {
  pname = "celery-redbeat";
  version = "2.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "celery";
    repo = "django-celery-beat";
    tag = "v${version}";
    hash = "sha256-UGKMSXB+Hg865sAk5ePc/noO3eNTr7b3pp7tvNvn1T8=";
  };

  postPatch = ''
    # Hack the custom dependency resolution in setup.py to avoid pulling in pip
    substituteInPlace setup.py \
      --replace-fail "install_requires=reqs('default.txt') + reqs('runtime.txt')," "install_requires=[],"
  '';

  build-system = [ setuptools ];

  dependencies = [
    celery
    cron-descriptor
    django
    django-timezone-field
    python-crontab
    python-dateutil
  ];
  pythonImportsCheck = [ "django_celery_beat" ];

  # Tests require additional work
  doCheck = false;

  meta = {
    description = "Database-backed Periodic Tasks";
    homepage = "https://github.com/celery/django-celery-beat";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
