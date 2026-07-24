{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
  django,
}:

buildPythonPackage rec {
  pname = "django-filter";
  version = "26.1";
  pyproject = true;

  src = fetchPypi {
    pname = "django_filter";
    inherit version;
    hash = "sha256-ZuoEAxsGjHfIbhrCbO16P48Tznl/V5V1Fwfj3u/FgFQ=";
  };

  build-system = [ flit-core ];

  dependencies = [ django ];

  pythonImportsCheck = [ "django_filters" ];

  doCheck = false;

  meta = {
    description = "Reusable Django application for allowing users to filter querysets dynamically";
    homepage = "https://github.com/carltongibson/django-filter";
    license = lib.licenses.bsd3;
  };
}
