{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  decorator,
  ipython,
}:

buildPythonPackage rec {
  pname = "ipdb";
  version = "0.13.13";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-46xgGO8FEm1EKvaAqthjAG7BnQIpBWGsiLixwLDPxyY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    decorator
    ipython
  ];

  pythonImportsCheck = [ "ipdb" ];

  meta = {
    description = "IPython-enabled pdb";
    homepage = "https://github.com/gotcha/ipdb";
    license = lib.licenses.bsd0;
  };
}
