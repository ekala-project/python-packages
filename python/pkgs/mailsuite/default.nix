{
  lib,
  azure-identity,
  authres,
  buildPythonPackage,
  cryptography,
  dkimpy,
  dnspython,
  expiringdict,
  fetchFromGitHub,
  google-api-python-client,
  google-auth,
  google-auth-oauthlib,
  hatchling,
  html2text,
  imapclient,
  mail-parser,
  msgraph-sdk,
  publicsuffix2,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "mailsuite";
  version = "2.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "seanthegeek";
    repo = "mailsuite";
    tag = finalAttrs.version;
    hash = "sha256-u/o5XcRYB5Nck6XakQkjev3EhsjHJPq9Q+Nx1C8EvqM=";
  };

  pythonRelaxDeps = [
    "cryptography"
    "mail-parser"
  ];

  build-system = [ hatchling ];

  dependencies = [
    authres
    cryptography
    dkimpy
    dnspython
    expiringdict
    html2text
    mail-parser
    imapclient
    publicsuffix2
  ];

  optional-dependencies = {
    all = lib.concatAttrValues (lib.removeAttrs finalAttrs.passthru.optional-dependencies [ "all" ]);
    gmail = [
      google-api-python-client
      google-auth
      google-auth-oauthlib
    ];
    msgraph = [
      azure-identity
      msgraph-sdk
    ];
  };

  pythonImportsCheck = [ "mailsuite" ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  meta = {
    description = "Python package to simplify receiving, parsing, and sending email";
    homepage = "https://seanthegeek.github.io/mailsuite/";
    license = lib.licenses.asl20;
  };
})
