{
  lib,
  cryptography,
  buildPythonPackage,
  fetchPypi,
  pyjwt,
  requests,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "msal";
  version = "1.39.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-arfeM15tf1cX4sfh2/huTdovas88Vnc7eNxT68Y5W18=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    pyjwt
    requests
  ]
  ++ pyjwt.optional-dependencies.crypto;

  pythonImportsCheck = [ "msal" ];

  meta = {
    description = "Library to access the Microsoft Cloud by supporting authentication of users with Microsoft Azure Active Directory accounts (AAD) and Microsoft Accounts (MSA) using industry standard OAuth2 and OpenID Connect";
    homepage = "https://github.com/AzureAD/microsoft-authentication-library-for-python";
    license = lib.licenses.mit;
  };
})
