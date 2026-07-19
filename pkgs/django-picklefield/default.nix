{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  django,
}:

buildPythonPackage rec {
  pname = "django-picklefield";
  version = "3.4.0";
  pyproject = true;

  src = fetchPypi {
    pname = "django_picklefield";
    inherit version;
    hash = "sha256-Oh90BTbA5g0NukOqiczb6Gdg1MP47Ed5nq4SK6p0HQo=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];

  pythonImportsCheck = [ "picklefield" ];

  doCheck = false;

  meta = {
    description = "Pickled object field for Django";
    homepage = "https://github.com/gintas/django-picklefield";
    license = lib.licenses.mit;
  };
}
