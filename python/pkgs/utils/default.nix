{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "utils";
  version = "1.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "haaksmash";
    repo = "pyutils";
    tag = version;
    hash = "sha256-eb2trh3eawdAcPo3De9NgYN2HT1+FGju/F4V7lga+R4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "utils" ];

  meta = {
    description = "Python set of utility functions and objects";
    homepage = "https://github.com/haaksmash/pyutils";
    license = lib.licenses.lgpl3Only;
  };
}
