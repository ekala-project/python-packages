{
  lib,
  buildPythonPackage,
  fetchPypi,
  django,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-reversion";
  version = "6.5.1";
  pyproject = true;

  src = fetchPypi {
    pname = "django_reversion";
    inherit (finalAttrs) version;
    hash = "sha256-6wEx24IEFrYfq7ddDoE8xA2Mwwq0WiXfbIeskZImZ4Y=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];

  # Tests assume the availability of a mysql/postgresql database

  pythonImportsCheck = [ "reversion" ];

  meta = {
    description = "Extension to the Django web framework that provides comprehensive version control facilities";
    homepage = "https://github.com/etianen/django-reversion";
    license = lib.licenses.bsd3;
  };
})
