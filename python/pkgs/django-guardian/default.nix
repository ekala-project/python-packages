{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  django-environ,
  django,
  pytest-django,
  pytest-xdist,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-guardian";
  version = "3.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-guardian";
    repo = "django-guardian";
    tag = finalAttrs.version;
    hash = "sha256-0zUdcDeJ40AuYSzhjy3/htU43cy6T54rZOj2zFo6J+8=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];
  pythonImportsCheck = [ "guardian" ];

  meta = {
    description = "Per object permissions for Django";
    homepage = "https://github.com/django-guardian/django-guardian";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
})
