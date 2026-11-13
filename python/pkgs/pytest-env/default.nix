{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  hatch-vcs,
  hatch-fancy-pypi-readme,

  # dependencies
  pytest,
  python-dotenv,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-env";
  version = "1.8.5";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_env";
    inherit (finalAttrs) version;
    hash = "sha256-mSw379wb3i8Hg5dQgKxM3OqF82351v46g17dAafgZYQ=";
  };

  build-system = [
    hatchling
    hatch-vcs
    hatch-fancy-pypi-readme
  ];

  # python-dotenv 1.2.4 is not yet available; 1.2.3 is compatible
  pythonRelaxDeps = [ "python-dotenv" ];

  dependencies = [
    pytest
    python-dotenv
  ];

  pythonImportsCheck = [ "pytest_env" ];

  meta = {
    description = "Pytest plugin used to set environment variables";
    homepage = "https://github.com/pytest-dev/pytest-env";
    license = lib.licenses.mit;
  };
})
