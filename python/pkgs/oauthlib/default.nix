{
  lib,
  blinker,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  pyjwt,
  setuptools,
}:

buildPythonPackage rec {
  pname = "oauthlib";
  version = "3.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "oauthlib";
    repo = "oauthlib";
    tag = "v${version}";
    hash = "sha256-ZTmR+pTNQaRQMnUA+8hXM5VACRd8Hn62KTNooy5FQyk=";
  };

  nativeBuildInputs = [ setuptools ];

  optional-dependencies = {
    rsa = [ cryptography ];
    signedtoken = [
      cryptography
      pyjwt
    ];
    signals = [ blinker ];
  };

  pythonImportsCheck = [ "oauthlib" ];

  meta = {
    description = "Generic, spec-compliant, thorough implementation of the OAuth request-signing logic";
    homepage = "https://github.com/oauthlib/oauthlib";
    license = lib.licenses.bsd3;
  };
}
