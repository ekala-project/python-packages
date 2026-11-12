{
  lib,
  buildPythonPackage,
  django,
  fetchFromGitHub,
  icalendar,
  pytestCheckHook,
  pytest-django,
  python-dateutil,
  pytz,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-scheduler";
  version = "0.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "llazzaro";
    repo = "django-scheduler";
    tag = "v${finalAttrs.version}";
    hash = "sha256-VdnKXyXGNPlOH50s8vPmF1A6BinntC1i+8v5gup7mts=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    icalendar
    python-dateutil
    pytz
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-django
  ];

  preCheck = ''
    export DJANGO_SETTINGS_MODULE=tests.settings
  '';

  disabledTests = lib.optionals (lib.versionAtLeast django.version "5.1") [
    # test_delete_event_authenticated_user - AssertionError: 302 != 200
    "test_delete_event_authenticated_user"
    "test_event_creation_authenticated_user"
  ];

  pythonImportsCheck = [ "schedule" ];

  meta = {
    description = "Calendar app for Django";
    homepage = "https://github.com/llazzaro/django-scheduler";
    license = lib.licenses.bsd3;
  };
})
