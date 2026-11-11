{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  hatch-vcs,
  hatch-fancy-pypi-readme,

  # dependencies
  packaging,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyproject-api";
  version = "1.12.5";
  pyproject = true;

  src = fetchPypi {
    pname = "pyproject_api";
    inherit (finalAttrs) version;
    hash = "sha256-B5VpNwj2Ma9MZlqwKjFe3A+5dHHx1S5KYXntYFBOlrs=";
  };

  build-system = [
    hatchling
    hatch-vcs
    hatch-fancy-pypi-readme
  ];

  # packaging>=26.3 is required, but only 26.2 is available in the package set
  pythonRelaxDeps = [ "packaging" ];

  dependencies = [ packaging ];

  pythonImportsCheck = [ "pyproject_api" ];

  meta = {
    description = "API to interact with the python pyproject.toml based projects";
    homepage = "https://github.com/tox-dev/pyproject-api";
    license = lib.licenses.mit;
  };
})
