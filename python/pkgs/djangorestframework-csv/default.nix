{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  django,
  djangorestframework,
  pytest-django,
  python,
}:

buildPythonPackage rec {
  pname = "djangorestframework-csv";
  version = "3.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mjumbewu";
    repo = "django-rest-framework-csv";
    tag = version;
    hash = "sha256-XtMkSucB7+foRpTaRfGF1Co0n3ONNGyzex6MXR4xM5c=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    djangorestframework
  ];
  checkPhase = ''
    runHook preCheck
    ${python.interpreter} manage.py test
    runHook postCheck
  '';

  pythonImportsCheck = [ "rest_framework_csv" ];

  meta = {
    description = "CSV Tools for Django REST Framework";
    homepage = "https://github.com/mjumbewu/django-rest-framework-csv";
    license = lib.licenses.bsd2;
  };
}
