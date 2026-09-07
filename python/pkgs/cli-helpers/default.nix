{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  configobj,
  tabulate,
}:

buildPythonPackage rec {
  pname = "cli-helpers";
  version = "2.15.1";
  pyproject = true;

  src = fetchPypi {
    pname = "cli_helpers";
    inherit version;
    hash = "sha256-6cCCbdooVXRetjs/2OM7asiIEYjyupHlGlFu2DP8DLg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    configobj
    tabulate
  ];

  pythonImportsCheck = [ "cli_helpers" ];

  meta = {
    description = "Python helpers for common CLI tasks";
    homepage = "https://cli-helpers.readthedocs.io/en/stable/";
    license = lib.licenses.bsd3;
  };
}
