{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  configobj,
  tabulate,
}:

buildPythonPackage (finalAttrs: {
  pname = "cli-helpers";
  version = "2.15.3";
  pyproject = true;

  src = fetchPypi {
    pname = "cli_helpers";
    inherit (finalAttrs) version;
    hash = "sha256-/eR9FJXkmJes0+CE2TYA26WIWnkHO4nq0UxA0oxhDBk=";
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
})
