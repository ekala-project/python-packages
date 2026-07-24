{
  lib,
  betamax,
  buildPythonPackage,
  fetchFromGitHub,
  requests-toolbelt,
  setuptools,
}:

buildPythonPackage rec {
  pname = "betamax-matchers";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "betamaxpy";
    repo = "betamax_matchers";
    tag = version;
    hash = "sha256-BV9DOfZLDAZIr2E75l988QxFWWvazBL9VttxGFIez1M=";
  };

  build-system = [ setuptools ];

  dependencies = [
    betamax
    requests-toolbelt
  ];
  pythonImportsCheck = [ "betamax_matchers" ];

  meta = {
    description = "Group of experimental matchers for Betamax";
    homepage = "https://github.com/sigmavirus24/betamax_matchers";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
