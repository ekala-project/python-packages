{
  lib,
  buildPythonPackage,
  django,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  pytest-django,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-formtools";
  version = "2.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jazzband";
    repo = "django-formtools";
    tag = finalAttrs.version;
    hash = "sha256-cg6bl2KJL2aOES7vWqrR25Bd6t9vWGTZLWtbMUhkCkg=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ django ];
  pythonImportsCheck = [ "formtools" ];

  meta = {
    description = "High-level abstractions for Django forms";
    homepage = "https://github.com/jazzband/django-formtools";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
