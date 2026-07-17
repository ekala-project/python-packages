{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  argcomplete,
  colorlog,
  packaging,
  virtualenv,
}:

buildPythonPackage rec {
  pname = "nox";
  version = "2024.10.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-eqncjRwn6fRasEb/0cOyxPfJF1UwR2nfIxMIhJ697ZU=";
  };

  build-system = [ hatchling ];

  dependencies = [
    argcomplete
    colorlog
    packaging
    virtualenv
  ];

  pythonImportsCheck = [ "nox" ];

  doCheck = false;

  meta = {
    description = "Flexible test automation for Python";
    homepage = "https://github.com/wntrblm/nox";
    license = lib.licenses.asl20;
  };
}
