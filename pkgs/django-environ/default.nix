{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "django-environ";
  version = "0.14.0";
  pyproject = true;

  src = fetchPypi {
    pname = "django_environ";
    inherit version;
    hash = "sha256-tsSNk7nS/4o+oUCZ6Qw1qk8QHBtNXyYt/uDSewZ0Ltc=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "environ" ];

  meta = {
    description = "Utilize environment variables to configure your Django application";
    homepage = "https://github.com/joke2k/django-environ/";
    license = lib.licenses.mit;
  };
}
