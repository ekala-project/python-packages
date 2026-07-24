{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  django,
  pytest-django,
}:

buildPythonPackage rec {
  pname = "django-js-asset";
  version = "4.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "matthiask";
    repo = "django-js-asset";
    tag = version;
    hash = "sha256-TmoT+WuOw92wWW82CpKLy0Lr+oSKf+c2diG8Gs5rWg4=";
  };

  build-system = [ hatchling ];

  dependencies = [ django ];

  pythonImportsCheck = [ "js_asset" ];
  meta = {
    description = "Script tag with additional attributes for django.forms.Media";
    homepage = "https://github.com/matthiask/django-js-asset";
    maintainers = [ ];
    license = lib.licenses.bsd3;
  };
}
