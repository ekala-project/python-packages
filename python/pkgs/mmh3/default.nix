{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mmh3";
  version = "5.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hajimes";
    repo = "mmh3";
    tag = "v${version}";
    hash = "sha256-5a9r2nEuMeVPAEPy7NkG/RNeSsKtKSy2IjEbhBWTaDc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mmh3" ];

  meta = {
    description = "Python wrapper for MurmurHash3, a set of fast and robust hash functions";
    homepage = "https://github.com/hajimes/mmh3";
    license = lib.licenses.cc0;
  };
}
