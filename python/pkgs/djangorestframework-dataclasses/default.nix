{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  djangorestframework,
  pytest-django,
  setuptools,
}:

buildPythonPackage rec {
  pname = "djangorestframework-dataclasses";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "oxan";
    repo = "djangorestframework-dataclasses";
    tag = "v${version}";
    hash = "sha256-nUkR5xTyeBv7ziJ6Mej9TKvMOa5/k+ELBqt4BVam/wk=";
  };

  postPatch = ''
    patchShebangs manage.py
  '';

  build-system = [ setuptools ];

  dependencies = [ djangorestframework ];
  env.DJANGO_SETTINGS_MODULE = "tests.django_settings";

  pythonImportsCheck = [ "rest_framework_dataclasses" ];

  meta = {
    description = "Dataclasses serializer for Django REST framework";
    homepage = "https://github.com/oxan/djangorestframework-dataclasses";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
