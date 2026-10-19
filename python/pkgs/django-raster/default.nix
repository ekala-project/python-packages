{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  isPy3k,
  numpy,
  django-colorful,
  pillow,
  psycopg2,
  pyparsing,
  django,
  celery,
  boto3,
  importlib-metadata,
}:

buildPythonPackage (finalAttrs: {
  version = "0.8.1";
  pyproject = true;
  pname = "django-raster";

  disabled = !isPy3k;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "213758fe96d74be502f69f2620f7666961a85caa0551d14573637315035a9745";
  };

  build-system = [ setuptools ];

  # Tests require a postgresql + postgis server

  dependencies = [
    numpy
    django-colorful
    pillow
    psycopg2
    pyparsing
    django
    celery
    boto3
    importlib-metadata
  ];

  meta = {
    description = "Basic raster data integration for Django";
    homepage = "https://github.com/geodesign/django-raster";
    license = lib.licenses.mit;
  };
})
