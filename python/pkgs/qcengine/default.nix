{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  pyyaml,
  py-cpuinfo,
  psutil,
  qcelemental,
  pydantic,
  pydantic-settings,
  packaging,
}:

buildPythonPackage (finalAttrs: {
  pname = "qcengine";
  version = "0.52.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-K9zJPTOkOot5n0fYFS7DtK4CND6X2h7LZW10HIzpMOg=";
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
    mainProgram = "qcengine";
  };
})
