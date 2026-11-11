{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  django,
  djangorestframework,
  inflection,
  packaging,
  pytz,
  pyyaml,
  swagger-spec-validator,
  uritemplate,
  datadiff,
  dj-database-url,
  pytest-django,
}:

buildPythonPackage (finalAttrs: {
  pname = "drf-yasg";
  version = "1.21.18";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "drf_yasg";
    hash = "sha256-yTsTldqPO5EghclrRfVhtsXWMmgl6gBAdhvIx0SsulI=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools-scm ~= 7.0" "setuptools-scm >= 7.0"
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    django
    djangorestframework
    inflection
    packaging
    pytz
    pyyaml
    swagger-spec-validator
    uritemplate
  ];
  env.DJANGO_SETTINGS_MODULE = "testproj.settings.local";
  # a lot of libraries are missing

  pythonImportsCheck = [ "drf_yasg" ];

  meta = {
    description = "Generation of Swagger/OpenAPI schemas for Django REST Framework";
    homepage = "https://github.com/axnsan12/drf-yasg";
    license = lib.licenses.bsd3;
  };
})
