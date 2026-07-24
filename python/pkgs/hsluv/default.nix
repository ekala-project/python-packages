{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "hsluv";
  version = "5.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hsluv";
    repo = "hsluv-python";
    rev = "v${version}";
    hash = "sha256-bjivmPTU3Gp3pcC0ru4GSZANdhPqS1QSTMeiPGN8GCI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "hsluv" ];

  meta = {
    description = "Python implementation of HSLuv";
    homepage = "https://github.com/hsluv/hsluv-python";
    license = lib.licenses.mit;
  };
}
