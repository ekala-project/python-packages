{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  hatch-vcs,

  # dependencies
  packaging,
}:

buildPythonPackage rec {
  pname = "pyproject-api";
  version = "1.11.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pyproject_api";
    inherit version;
    hash = "sha256-uIB9haKT5snxM+ZXWUb+1F8dQrItWMeAszqiQhp5lUk=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [ packaging ];

  doCheck = false;

  pythonImportsCheck = [ "pyproject_api" ];

  meta = {
    description = "API to interact with the python pyproject.toml based projects";
    homepage = "https://github.com/tox-dev/pyproject-api";
    license = lib.licenses.mit;
  };
}
