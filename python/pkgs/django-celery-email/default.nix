{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  django,
  django-appconf,
  celery,
  pytest-django,
  pytestCheckHook,
  python,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-celery-email";
  version = "3.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pmclanahan";
    repo = "django-celery-email";
    tag = finalAttrs.version;
    hash = "sha256-LBavz5Nh2ObmIwLCem8nHvsuKgPwkzbS/OzFPmSje/M=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    django-appconf
    celery
  ];

  env.DJANGO_SETTINGS_MODULE = "tests.settings";

  nativeCheckInputs = [
    pytest-django
    pytestCheckHook
  ];

  checkPhase = ''
    ${python.executable} runtests.py
  '';

  pythonImportsCheck = [ "djcelery_email" ];

  meta = {
    homepage = "https://github.com/pmclanahan/django-celery-email";
    description = "Django email backend that uses a celery task for sending the email";
    license = lib.licenses.bsd3;
  };
})
