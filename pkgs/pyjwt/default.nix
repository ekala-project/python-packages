{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cryptography,
}:

buildPythonPackage rec {
  pname = "pyjwt";
  version = "2.12.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jpadilla";
    repo = "pyjwt";
    tag = version;
    hash = "sha256-wgOa5JhQT82ppoad6s8gPH7tGRNbbVWmJaaDF84d+r0=";
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
