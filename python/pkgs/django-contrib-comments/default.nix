{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  django,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-contrib-comments";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-SN4A8VZ34BaiFq7/IF1uAOQ5HJpXAhNsZBGcRytzVto=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];

  meta = {
    homepage = "https://github.com/django/django-contrib-comments";
    description = "Code formerly known as django.contrib.comments";
    license = lib.licenses.bsd0;
  };
})
