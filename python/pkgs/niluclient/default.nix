{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "niluclient";
  version = "0.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "11ymn0cr4lchrcnf2xxlgljw223gwln01gxwr7mcgf95yc4006iq";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # Project has no tests

  pythonImportsCheck = [ "niluclient" ];

  meta = {
    description = "Python client for getting air pollution data from NILU sensor stations";
    homepage = "https://github.com/hfurubotten/niluclient";
    license = lib.licenses.mit;
  };
}
