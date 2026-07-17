{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "django-environ";
  version = "0.12.0";
  pyproject = true;

  src = fetchPypi {
    pname = "django_environ";
    inherit version;
    hash = "sha256-In3IkUU91b3nacNEnPSnS28u6PerI2HJOgcGj0F5BBo=";
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
