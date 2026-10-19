{
  lib,
  buildPythonPackage,
  django,
  djangorestframework,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "djangorestframework-recursive";
  version = "0.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "heywbj";
    repo = "django-rest-framework-recursive";
    tag = finalAttrs.version;
    hash = "sha256-Q/6yxpz3c402sMZudAeFIht9+5GmTRlzM51AMAx5muY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    djangorestframework
  ];

  # incompatible with newer django versions

  pythonImportsCheck = [ "rest_framework_recursive" ];

  meta = {
    description = "Recursive Serialization for Django REST framework";
    homepage = "https://github.com/heywbj/django-rest-framework-recursive";
    license = lib.licenses.isc;
  };
})
