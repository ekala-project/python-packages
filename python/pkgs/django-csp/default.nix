{
  lib,
  fetchPypi,
  buildPythonPackage,

  # build-system
  setuptools,

  # dependencies
  django,

  # tests
  jinja2,
  pytest-django,
}:

buildPythonPackage rec {
  pname = "django-csp";
  version = "4.0";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "django_csp";
    hash = "sha256-snAQu3Ausgo9rTKReN8rYaK4LTOLcPvcE8OjvShxKDM=";
  };

  postPatch = ''
    sed -i "/addopts =/d" pyproject.toml
  '';

  build-system = [ setuptools ];

  dependencies = [ django ];
  meta = {
    description = "Adds Content-Security-Policy headers to Django";
    homepage = "https://github.com/mozilla/django-csp";
    license = lib.licenses.bsd3;
  };
}
