{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "mergedict";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4ZkrNqVCKQFPvLx6nIwo0fSuEx6h2NNFyTlz+fDcb9w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mergedict" ];

  meta = {
    homepage = "https://github.com/schettino72/mergedict";
    description = "Python dict with a merge() method";
    license = lib.licenses.mit;
  };
}
