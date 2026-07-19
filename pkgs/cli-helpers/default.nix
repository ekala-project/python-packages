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
  version = "2.14.0";
  pyproject = true;

  src = fetchPypi {
    pname = "cli_helpers";
    inherit version;
    hash = "sha256-eY4HMfL01CV2fLEqOtlmvyi13nelZRZiBhu0pmvujzU=";
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
