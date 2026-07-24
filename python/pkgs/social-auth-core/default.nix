{
  lib,
  buildPythonPackage,
  cryptography,
  defusedxml,
  fetchFromGitHub,
  httpretty,
  lxml,
  oauthlib,
  pyjwt,
  pytest-cov-stub,
  pytest-xdist,
  python-jose,
  python3-openid,
  python3-saml,
  requests,
  requests-oauthlib,
  responses,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "social-auth-core";
  version = "4.9.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-social-auth";
    repo = "social-core";
    tag = version;
    hash = "sha256-HIRqueDoT5MiK5wYto1/MhZOJVBGUdsHma/klOyVHtM=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    cryptography
    defusedxml
    oauthlib
    pyjwt
    python3-openid
    requests
    requests-oauthlib
  ];

  optional-dependencies = {
    openidconnect = [ python-jose ];
    saml = [
      lxml
      python3-saml
    ];
    azuread = [ cryptography ];
  };
  pythonImportsCheck = [ "social_core" ];

  meta = {
    description = "Module for social authentication/registration mechanisms";
    homepage = "https://github.com/python-social-auth/social-core";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
