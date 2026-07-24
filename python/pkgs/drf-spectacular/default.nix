{
  lib,
  buildPythonPackage,
  dj-rest-auth,
  django,
  django-allauth,
  django-filter,
  django-oauth-toolkit,
  django-polymorphic,
  django-rest-auth,
  django-rest-polymorphic,
  djangorestframework,
  djangorestframework-camel-case,
  djangorestframework-dataclasses,
  djangorestframework-recursive,
  djangorestframework-simplejwt,
  drf-jwt,
  drf-nested-routers,
  drf-spectacular-sidecar,
  fetchFromGitHub,
  fetchpatch,
  inflection,
  jsonschema,
  psycopg2,
  pytest-django,
  pyyaml,
  setuptools,
  uritemplate,
}:

buildPythonPackage rec {
  pname = "drf-spectacular";
  version = "0.29.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tfranzel";
    repo = "drf-spectacular";
    tag = version;
    hash = "sha256-7Eq0Z/BR/tvGS6RRRoy3jOyBQkc58QETHWy47S6tSD8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    djangorestframework
    inflection
    jsonschema
    pyyaml
    uritemplate
  ];
  pythonImportsCheck = [ "drf_spectacular" ];

  optional-dependencies.sidecar = [ drf-spectacular-sidecar ];

  meta = {
    description = "Sane and flexible OpenAPI 3 schema generation for Django REST framework";
    homepage = "https://github.com/tfranzel/drf-spectacular";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
