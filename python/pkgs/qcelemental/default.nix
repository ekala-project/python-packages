{
  stdenv,
  buildPythonPackage,
  lib,
  fetchPypi,
  poetry-core,
  setuptools,
  setuptools-scm,
  ipykernel,
  networkx,
  numpy,
  packaging,
  pint,
  pydantic,
  scipy,
}:

buildPythonPackage rec {
  pname = "qcelemental";
  version = "0.50.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jVOCbTP/FXyqL1yJbBkxHPPJ2vcZyrjG+GBg+V1fdEs=";
  };

  build-system = [
    poetry-core
    setuptools
    setuptools-scm
  ];

  dependencies = [
    numpy
    packaging
    pint
    pydantic
  ];

  optional-dependencies = {
    viz = [
      # TODO: nglview
      ipykernel
    ];
    align = [
      networkx
      scipy
    ];
  };

  pythonImportsCheck = [ "qcelemental" ];

  # These tests require network access
  meta = {
    broken = stdenv.hostPlatform.isDarwin;
    description = "Periodic table, physical constants and molecule parsing for quantum chemistry";
    homepage = "https://github.com/MolSSI/QCElemental";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
