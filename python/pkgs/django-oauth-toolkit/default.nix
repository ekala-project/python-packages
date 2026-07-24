{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,

  # propagates
  django,
  jwcrypto,
  requests,
  oauthlib,

  # tests
  djangorestframework,
  pytest-cov-stub,
  pytest-django,
  pytest-mock,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-oauth-toolkit";
  version = "3.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jazzband";
    repo = "django-oauth-toolkit";
    tag = finalAttrs.version;
    hash = "sha256-eRQzAFUvSgoDiP7LW/+hMrNxHuXVxY+wc/E3VU/zeXo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    django
    jwcrypto
    oauthlib
    requests
  ];
  # xdist is disabled right now because it can cause race conditions on high core machines
  # https://github.com/jazzband/django-oauth-toolkit/issues/1300
  meta = {
    description = "OAuth2 goodies for the Djangonauts";
    homepage = "https://github.com/jazzband/django-oauth-toolkit";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
})
