{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pybase64";
  version = "1.4.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mayeut";
    repo = "pybase64";
    tag = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-cR8Ht6QbHXCED86xCbiLg4bxt1Hkv4Ota7R+voZE3yo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pybase64" ];

  meta = {
    description = "Fast Base64 encoding/decoding";
    homepage = "https://github.com/mayeut/pybase64";
    license = lib.licenses.bsd2;
  };
}
