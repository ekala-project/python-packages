{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pybase64";
  version = "1.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mayeut";
    repo = "pybase64";
    tag = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-7cUgvY/RLpkl6EfDCnki299m+KD2EpDLwIt4ut1hs38=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pybase64" ];

  meta = {
    description = "Fast Base64 encoding/decoding";
    homepage = "https://github.com/mayeut/pybase64";
    license = lib.licenses.bsd2;
  };
}
