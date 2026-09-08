{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mmh3";
  version = "5.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hajimes";
    repo = "mmh3";
    tag = "v${version}";
    hash = "sha256-RvVsPOB104XovIGP2Fz2l8IIYHbkZYPX8PnA/jSbxCI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mmh3" ];

  meta = {
    description = "Python wrapper for MurmurHash3, a set of fast and robust hash functions";
    homepage = "https://github.com/hajimes/mmh3";
    license = lib.licenses.cc0;
  };
}
