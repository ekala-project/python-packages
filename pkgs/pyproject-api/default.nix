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
  version = "1.10.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pyproject_api";
    inherit version;
    hash = "sha256-QMby2C7r3Er+5hx3PtIIwEwZ20xKYNl/jXvj68C7szA=";
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
