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
  version = "1.38.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-TxD/Ele6z9F4HyLoW9K41DrRtJDztqr9eQZnHK3t1GQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    pyjwt
    requests
  ]
  ++ pyjwt.optional-dependencies.crypto;

  doCheck = false;

  pythonImportsCheck = [ "msal" ];

  meta = {
    description = "Library to access the Microsoft Cloud by supporting authentication of users with Microsoft Azure Active Directory accounts (AAD) and Microsoft Accounts (MSA) using industry standard OAuth2 and OpenID Connect";
    homepage = "https://github.com/AzureAD/microsoft-authentication-library-for-python";
    license = lib.licenses.mit;
  };
})
