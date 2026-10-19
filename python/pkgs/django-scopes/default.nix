{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  django,
  pytestCheckHook,
  pytest-django,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-scopes";
  version = "2.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "raphaelm";
    repo = "django-scopes";
    tag = finalAttrs.version;
    hash = "sha256-CtToztLVvSb91pMpPNL8RysQJzlRkeXuQbpvbkX3jfM=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];

  nativeCheckInputs = [
    pytest-django
    pytestCheckHook
  ];

  pythonImportsCheck = [ "django_scopes" ];

  meta = {
    description = "Safely separate multiple tenants in a Django database";
    homepage = "https://github.com/raphaelm/django-scopes";
    license = lib.licenses.asl20;
  };
})
