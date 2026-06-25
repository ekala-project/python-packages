{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  importlib-metadata,
}:

buildPythonPackage rec {
  pname = "importlib-resources";
  version = "6.5.2";
  pyproject = true;

  src = fetchPypi {
    pname = "importlib_resources";
    inherit version;
    hash = "sha256-GF+Hre9bzCiESdmPtPugfOp4vANkVd1ExfxKL+eP7Sw=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ importlib-metadata ];

  pythonImportsCheck = [ "importlib_resources" ];

  meta = {
    description = "Read resources from Python packages";
    homepage = "https://importlib-resources.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}
