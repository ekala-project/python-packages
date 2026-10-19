{
  lib,
  buildPythonPackage,
  fetchPypi,
  django,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-multiselectfield";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "django_multiselectfield";
    inherit (finalAttrs) version;
    hash = "sha256-P4tP/z4H1Kkci7S4Cbw1yusitBdptgb0ye3FO41ypmc=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];

  # No tests

  pythonImportsCheck = [ "multiselectfield" ];

  meta = {
    description = "Multiple Choice model field for Django";
    homepage = "https://github.com/goinnn/django-multiselectfield";
    license = lib.licenses.lgpl3Plus;
  };
})
