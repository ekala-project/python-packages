{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  django,
}:

buildPythonPackage rec {
  pname = "django-appconf";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "django_appconf";
    inherit version;
    hash = "sha256-FaiNYN2ULWBZ9GdBL+RYHbYy7wMBijwYP7QV1vyeXOw=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];

  pythonImportsCheck = [ "appconf" ];

  meta = {
    homepage = "https://django-appconf.readthedocs.org/";
    description = "Helper class for handling configuration defaults of packaged apps gracefully";
    license = lib.licenses.bsd2;
  };
}
