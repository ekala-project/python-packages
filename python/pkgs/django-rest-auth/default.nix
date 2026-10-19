{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  django,
  django-allauth,
  djangorestframework,
  drf-jwt,
  responses,
  six,
}:

buildPythonPackage rec {
  pname = "django-rest-auth";
  version = "0.9.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Tivix";
    repo = "django-rest-auth";
    tag = version;
    hash = "sha256-rCChUHv8sTEFErDCZnPN5b5XVtMJ7JNVZwBYF3d99mY=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "djangorestframework-jwt" "drf-jwt"
  '';

  dependencies = [
    django
    djangorestframework
    six
  ];
  # tests are icnompatible with current django version

  pythonImportsCheck = [ "rest_auth" ];

  meta = {
    description = "Django app that makes registration and authentication easy";
    homepage = "https://github.com/Tivix/django-rest-auth";
    license = lib.licenses.mit;
  };
}
