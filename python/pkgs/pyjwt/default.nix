{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cryptography,
}:

buildPythonPackage rec {
  pname = "pyjwt";
  version = "2.13.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jpadilla";
    repo = "pyjwt";
    tag = version;
    hash = "sha256-q4ynXCJVDsyZh70439dloyWgRTLVm+elDOahUVOT5vA=";
  };

  build-system = [ setuptools ];

  optional-dependencies.crypto = [ cryptography ];

  pythonImportsCheck = [ "jwt" ];

  meta = {
    description = "JSON Web Token implementation in Python";
    homepage = "https://github.com/jpadilla/pyjwt";
    license = lib.licenses.mit;
  };
}
