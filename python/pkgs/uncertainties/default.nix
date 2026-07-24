{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # optional-dependencies
  numpy,

  # tests
  scipy,
}:

buildPythonPackage rec {
  pname = "uncertainties";
  version = "3.2.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lmfit";
    repo = "uncertainties";
    tag = version;
    hash = "sha256-XfEiE27azEBNCZ6sIBncJI1cYocoXwgxEkclVgR5O34=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  optional-dependencies.arrays = [ numpy ];
  pythonImportsCheck = [ "uncertainties" ];

  meta = {
    homepage = "https://uncertainties.readthedocs.io/";
    description = "Transparent calculations with uncertainties on the quantities involved (aka error propagation)";
    maintainers = [ ];
    license = lib.licenses.bsd3;
  };
}
