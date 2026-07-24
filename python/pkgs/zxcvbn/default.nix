{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zxcvbn";
  version = "4.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dwolfhub";
    repo = "zxcvbn-python";
    tag = "v${version}";
    hash = "sha256-0SVJkJMEMnZVMpamDVP02kMwWRSj5zGlrMYG9kn0aXQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zxcvbn" ];

  meta = {
    description = "Python implementation of Dropbox's realistic password strength estimator";
    homepage = "https://github.com/dwolfhub/zxcvbn-python";
    license = lib.licenses.mit;
  };
}
