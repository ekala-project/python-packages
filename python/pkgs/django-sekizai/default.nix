{
  lib,
  fetchPypi,
  # build-system
  setuptools,
  buildPythonPackage,
  django-classy-tags,
  pytest-django,
}:

buildPythonPackage rec {
  pname = "django-sekizai";
  version = "4.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Kso2y64LXAzv7ZVlQW7EQjNXZ/sxRb/xHlhiL8ZTza0=";
  };

  build-system = [ setuptools ];

  dependencies = [ django-classy-tags ];
  pythonImportsCheck = [ "sekizai" ];

  env.DJANGO_SETTINGS_MODULE = "tests.settings";

  meta = {
    description = "Define placeholders where your blocks get rendered and append to those blocks";
    homepage = "https://github.com/django-cms/django-sekizai";
    license = lib.licenses.bsd3;
  };
}
