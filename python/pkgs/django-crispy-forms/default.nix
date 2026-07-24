{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  django,
  setuptools,
  pytest-django,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-crispy-forms";
  version = "2.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-crispy-forms";
    repo = "django-crispy-forms";
    tag = finalAttrs.version;
    hash = "sha256-yU5xNlV3OFZUdO6zK1sG7mHGkNXLwZocEH8JhvAwyAc=";
  };

  propagatedBuildInputs = [
    django
    setuptools
  ];

  # FIXME: RuntimeError: Model class source.crispy_forms.tests.forms.CrispyTestModel doesn't declare an explicit app_label and isn't in an application in INSTALLED_APPS.
  doCheck = false;
  pythonImportsCheck = [ "crispy_forms" ];

  meta = {
    description = "Best way to have DRY Django forms";
    homepage = "https://django-crispy-forms.readthedocs.io/en/latest/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
