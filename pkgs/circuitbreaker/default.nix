{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "circuitbreaker";
  version = "2.1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fabfuel";
    repo = "circuitbreaker";
    tag = version;
    hash = "sha256-7BpYGhha0PTYzsE9CsN4KxfJW/wm2i6V+uAeamBREBQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "circuitbreaker" ];

  meta = {
    description = "Python Circuit Breaker implementation";
    homepage = "https://github.com/fabfuel/circuitbreaker";
    license = lib.licenses.bsd3;
  };
}
