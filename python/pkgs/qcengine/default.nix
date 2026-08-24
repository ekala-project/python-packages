{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, setuptools-scm
, pyyaml
, py-cpuinfo
, psutil
, qcelemental
, pydantic
, pydantic-settings
, packaging
,
}:

buildPythonPackage rec {
  pname = "qcengine";
  version = "0.50.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-x218Sq4QOoqTpcSM9TzQydhIn9LthflCuNh/P0stZmU=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    pyyaml
    py-cpuinfo
    psutil
    qcelemental
    pydantic
    pydantic-settings
    packaging
  ];

  pythonImportsCheck = [ "qcengine" ];

  # These tests require network access
  meta = {
    description = "Quantum chemistry program executor and IO standardizer (QCSchema) for quantum chemistry";
    homepage = "https://molssi.github.io/QCElemental/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
    mainProgram = "qcengine";
  };
}
