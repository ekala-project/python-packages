{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  betamax,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "betamax-serializers";
  version = "0.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NFxBmxtzFx8pUcYqw8cBd1rEt24T6GRk6/D/KpeOSUk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    betamax
    pyyaml
  ];

  pythonImportsCheck = [ "betamax_serializers" ];

  meta = {
    description = "Set of third-party serializers for Betamax";
    homepage = "https://gitlab.com/betamax/serializers";
    license = lib.licenses.asl20;
  };
}
