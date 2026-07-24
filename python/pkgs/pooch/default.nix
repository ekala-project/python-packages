{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  packaging,
  platformdirs,
  requests,
}:

buildPythonPackage rec {
  pname = "pooch";
  version = "1.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3kZylXm5hX/9PnQZh6L21eDgMhmJLBZ8ZXjACR+1Ee0=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    packaging
    platformdirs
    requests
  ];

  pythonImportsCheck = [ "pooch" ];

  meta = {
    description = "Friend to fetch your data files";
    homepage = "https://github.com/fatiando/pooch";
    license = lib.licenses.bsd3;
  };
}
