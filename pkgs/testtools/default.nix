{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonAtLeast,

  # build-system
  hatchling,
  hatch-vcs,

  # dependencies
  setuptools,
}:

buildPythonPackage rec {
  pname = "testtools";
  version = "2.9.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Oa2eueG5NdaDj0s67k1ucttl31YC9v7amY27T+jeCxk=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonRemoveDeps = [ "fixtures" ];

  dependencies = lib.optionals (pythonAtLeast "3.12") [ setuptools ];

  pythonImportsCheck = [ "testtools" ];

  meta = {
    description = "Set of extensions to the Python standard library's unit testing framework";
    homepage = "https://github.com/testing-cabal/testtools";
    license = lib.licenses.mit;
  };
}
