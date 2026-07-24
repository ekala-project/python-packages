{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pypubsub";
  version = "4.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "schollii";
    repo = "pypubsub";
    tag = "v${version}";
    hash = "sha256-i+7IR5s7A+kBApQ9OLCL8scnuQ+mRDRn361+jgQnRwo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pubsub" ];

  meta = {
    description = "Python 3 publish-subscribe library";
    homepage = "https://github.com/schollii/pypubsub";
    license = lib.licenses.bsd2;
  };
}
