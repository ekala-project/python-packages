{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  hatch-vcs,

  # dependencies
  pytest,
  python-dotenv,
}:

buildPythonPackage rec {
  pname = "pytest-env";
  version = "1.7.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_env";
    inherit version;
    hash = "sha256-DB3BEB+406s2Eej41le6BsPAwWf8hckEV+WyfyUI9D4=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    pytest
    python-dotenv
  ];

  pythonImportsCheck = [ "pytest_env" ];

  meta = {
    description = "Pytest plugin used to set environment variables";
    homepage = "https://github.com/MobileDynasty/pytest-env";
    license = lib.licenses.mit;
  };
}
