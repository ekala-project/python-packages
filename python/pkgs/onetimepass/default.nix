{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "onetimepass";
  version = "1.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tadeck";
    repo = "onetimepass";
    tag = "v${version}";
    hash = "sha256-cHJg3vdUpWp5+HACIeTGrqkHKUDS//aQICSjPKgwu3I=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "onetimepass" ];

  meta = {
    description = "One-time password library for HMAC-based (HOTP) and time-based (TOTP) passwords";
    homepage = "https://github.com/tadeck/onetimepass";
    license = lib.licenses.mit;
  };
}
