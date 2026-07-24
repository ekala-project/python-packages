{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  dj-database-url,
  django,
  django-test-migrations,
  djangorestframework,
  packaging,
  pytest-cov-stub,
  pytest-django,
  pytest-dotenv,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "djangorestframework-api-key";
  version = "3.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "florimondmanca";
    repo = "djangorestframework-api-key";
    tag = "v${finalAttrs.version}";
    hash = "sha256-TyYSO3OQslipl2T5BtsTABaTJD4HMCX61TOZXNR+lXE=";
  };

  # Use python-dotenv instead of django-dotenv
  # as django-dotenv has not been maintained for
  # years.
  patchPhase = ''
    runHook prePatch

    substituteInPlace tests/conftest.py test_project/manage.py \
      --replace-fail 'read_dotenv' 'load_dotenv'

    runHook postPatch
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    django
    djangorestframework
    packaging
  ];
  pythonImportsCheck = [
    "rest_framework_api_key"
  ];

  meta = {
    description = "API key permissions for Django REST Framework";
    homepage = "https://github.com/florimondmanca/djangorestframework-api-key";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
