{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  django,
  pillow,
  python-magic,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-versatileimagefield";
  version = "3.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-M5DiAEgJjol78pmwNgdj0QzQiWZbeu+OupAO7Lrq0Ng=";
  };

  build-system = [ setuptools ];
  dependencies = [
    pillow
    python-magic
  ];

  nativeCheckInputs = [ django ];

  # tests not included with pypi release

  pythonImportsCheck = [ "versatileimagefield" ];

  meta = {
    description = "Replaces django's ImageField with a more flexible interface";
    homepage = "https://github.com/respondcreate/django-versatileimagefield/";
    license = lib.licenses.mit;
  };
})
