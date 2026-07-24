{
  lib,
  buildPythonPackage,
  django,
  fetchFromGitHub,
  pytest-django,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-treebeard";
  version = "4.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-treebeard";
    repo = "django-treebeard";
    tag = finalAttrs.version;
    hash = "sha256-DrjI0HlrJhNqrYul3SO0xkkFwjWRn94OgvTA/Z3wv84=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];
  pythonImportsCheck = [ "treebeard" ];

  meta = {
    description = "Efficient tree implementations for Django";
    homepage = "https://tabo.pe/projects/django-treebeard/";
    license = lib.licenses.asl20;
  };
})
