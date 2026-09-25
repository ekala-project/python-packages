{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  setuptools,
  setuptools-scm,
  numpy,
  pandas,
}:

buildPythonPackage rec {
  pname = "ancpbids";
  version = "0.4.10";
  pyproject = true;

  # `tests/data` dir missing from PyPI dist
  src = fetchFromGitHub {
    owner = "ANCPLabOldenburg";
    repo = "ancp-bids";
    tag = version;
    hash = "sha256-yAirSGClMAx5us9D9I0Dtn2xbNdXYrMclqfIdcHv5E4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  nativeCheckInputs = [
    numpy
    pandas
    pytestCheckHook
  ];

  pythonImportsCheck = [ "ancpbids" ];

  enabledTestPaths = [ "tests/auto" ];

  disabledTests = [ "test_fetch_dataset" ];

  meta = {
    homepage = "https://ancpbids.readthedocs.io";
    description = "Read/write/validate/query BIDS datasets";
    license = lib.licenses.mit;
  };
}
