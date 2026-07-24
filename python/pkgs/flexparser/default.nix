{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  typing-extensions,

  # checks
}:

buildPythonPackage rec {
  pname = "flexparser";
  version = "0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hgrecco";
    repo = "flexparser";
    rev = version;
    hash = "sha256-0Ocp4GsrnzkpSqnP+AK5OxJ3KyUf5Uc6CegDXpRYRqo=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ typing-extensions ];
  pythonImportsCheck = [ "flexparser" ];

  meta = {
    description = "Parsing made fun ... using typing";
    homepage = "https://github.com/hgrecco/flexparser";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
