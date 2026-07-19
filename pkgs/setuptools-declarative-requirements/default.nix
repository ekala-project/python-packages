{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "setuptools-declarative-requirements";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "setuptools-declarative-requirements";
    inherit version;
    hash = "sha256-V6W5u5rTUMJ46Kpr5M3rvNklubpx1qcSoXimGM+4mPc=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "declarative_requirements" ];

  meta = {
    description = "Declarative setuptools Config Requirements Files Support";
    homepage = "https://github.com/s0undt3ch/setuptools-declarative-requirements";
    license = lib.licenses.asl20;
  };
}
