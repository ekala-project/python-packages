{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  flit-core,
}:

buildPythonPackage rec {
  pname = "handy_archives";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+6IRAf2eKdXjtygjJhqq4GuTUGhvDSBneG1k3Oc+s/Y=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "handy_archives" ];

  meta = {
    description = "Some handy archive helpers for Python";
    homepage = "https://github.com/domdfcoding/handy-archives";
    license = lib.licenses.mit;
  };
}
