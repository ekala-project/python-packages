{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
  django,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-filter";
  version = "26.2";
  pyproject = true;

  src = fetchPypi {
    pname = "django_filter";
    inherit (finalAttrs) version;
    hash = "sha256-/VzIOZX76fXwf7Xc2hb94PBN4ez474Jii2wOySG3Ua8=";
  };

  build-system = [ flit-core ];

  dependencies = [ django ];

  pythonImportsCheck = [ "django_filters" ];

  meta = {
    description = "Reusable Django application for allowing users to filter querysets dynamically";
    homepage = "https://github.com/carltongibson/django-filter";
    license = lib.licenses.bsd3;
  };
})
