{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "pint";
  version = "0.25.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-haRdHaj+nJ90d/7YrvWa0rk5rz1mEVB+Gpy9rNzTRQo=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonRemoveDeps = [
    "flexcache"
    "flexparser"
    "platformdirs"
  ];

  # pint requires flexcache/flexparser at import time
  # pythonImportsCheck = [ "pint" ];

  meta = {
    description = "Physical quantities module";
    homepage = "https://github.com/hgrecco/pint/";
    license = lib.licenses.bsd3;
  };
}
