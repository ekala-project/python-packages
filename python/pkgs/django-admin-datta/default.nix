{
  lib,
  buildPythonPackage,
  django,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "django-admin-datta";
  version = "1.0.19";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-65fUrV4FIbuVvNX93rgOCMjz4CoozMHEEVpzJqtbhKY=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];

  # no tests

  pythonImportsCheck = [ "admin_datta" ];

  meta = {
    description = "Modern template for Django that covers Admin Section";
    homepage = "https://appseed.us/product/datta-able/django";
    license = lib.licenses.mit;
  };
}
