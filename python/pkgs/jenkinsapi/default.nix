{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  mock,
  pytest-mock,
  pytestCheckHook,
  pytz,
  requests,
  six,
}:

buildPythonPackage rec {
  pname = "jenkinsapi";
  version = "0.3.23";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pycontribs";
    repo = "jenkinsapi";
    tag = version;
    hash = "sha256-NtILbbXu4dtYda28WaFiGkICf0bOmVMKOOnnrHptxsg=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    pytz
    requests
    six
  ];

  nativeCheckInputs = [
    mock
    pytest-mock
    pytestCheckHook
  ];

  # don't run tests that try to spin up jenkins
  disabledTests = [ "systests" ];

  pythonImportsCheck = [
    "jenkinsapi"
    "jenkinsapi.utils"
  ];

  meta = {
    description = "Python API for accessing resources on a Jenkins continuous-integration server";
    homepage = "https://github.com/salimfadhley/jenkinsapi";
    maintainers = [ ];
    license = lib.licenses.mit;
  };
}
