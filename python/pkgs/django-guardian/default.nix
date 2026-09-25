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
  version = "3.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-guardian";
    repo = "django-guardian";
    tag = finalAttrs.version;
    hash = "sha256-ogvmdU0h6yOnfczcseqbajQhrtS+iZdwRBonZHKD4Zs=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];
  pythonImportsCheck = [ "guardian" ];

  meta = {
    description = "Per object permissions for Django";
    homepage = "https://github.com/django-guardian/django-guardian";
    license = lib.licenses.bsd2;
  };
})
