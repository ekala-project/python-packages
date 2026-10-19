{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  django,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-model-utils";
  version = "5.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jazzband";
    repo = "django-model-utils";
    tag = finalAttrs.version;
    hash = "sha256-iRtTYXsgD8NYG3k9ZWAr2Nwazo3HUa6RgdbMeDxc7NI=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [ django ];

  # Test requires postgres database

  pythonImportsCheck = [ "model_utils" ];

  meta = {
    homepage = "https://github.com/jazzband/django-model-utils";
    description = "Django model mixins and utilities";
    license = lib.licenses.bsd3;
  };
})
