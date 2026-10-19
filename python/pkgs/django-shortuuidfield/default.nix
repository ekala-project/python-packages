{
  lib,
  buildPythonPackage,
  django,
  fetchPypi,
  # build-system
  setuptools,
  shortuuid,
  six,
}:

buildPythonPackage rec {
  pname = "django-shortuuidfield";
  version = "0.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-opLA/lU4q+lHsTHiuRTt2axEr8xqQOrscUSOYjGj7wA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    shortuuid
    six
  ];

  # no tests

  pythonImportsCheck = [ "shortuuidfield" ];

  meta = {
    description = "Short UUIDField for Django. Good for use in urls & file names";
    homepage = "https://github.com/benrobster/django-shortuuidfield";
    license = lib.licenses.bsd3;
  };
}
