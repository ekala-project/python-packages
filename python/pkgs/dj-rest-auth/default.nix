{
  lib,
  buildPythonPackage,
  django,
  django-allauth,
  djangorestframework,
  djangorestframework-simplejwt,
  fetchFromGitHub,
  python,
  responses,
  setuptools,
  unittest-xml-reporting,
  pyotp,
  pytest-django,
}:

buildPythonPackage (finalAttrs: {
  pname = "dj-rest-auth";
  version = "7.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "iMerica";
    repo = "dj-rest-auth";
    tag = finalAttrs.version;
    hash = "sha256-eUcve2KPcLjKKWU7AxQEZ0mokP185E43Xjm4b+4hQzA=";
  };

  build-system = [ setuptools ];

  buildInputs = [ django ];

  dependencies = [ djangorestframework ];

  optional-dependencies = {
    with_social = [
      django-allauth
    ]
    ++ django-allauth.optional-dependencies.socialaccount;
    with_mfa = [
      pyotp
    ];
  };
  pythonImportsCheck = [ "dj_rest_auth" ];

  meta = {
    description = "Authentication for Django Rest Framework";
    homepage = "https://github.com/iMerica/dj-rest-auth";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
