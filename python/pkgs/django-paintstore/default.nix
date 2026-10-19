{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-paintstore";
  version = "0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "12wxgwv1qbkfq7w5i7bm7aidv655c2sxp0ym73qf8606dxbjcwwg";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Django app that integrates jQuery ColorPicker with the Django admin";
    homepage = "https://github.com/gsiegman/django-paintstore";
    license = lib.licenses.mit;
  };
})
