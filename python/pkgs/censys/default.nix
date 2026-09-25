{
  lib,
  argcomplete,
  backoff,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  parameterized,
  pytest-mock,
  pytest-cov-stub,
  pytestCheckHook,
  pythonAtLeast,
  requests,
  requests-mock,
  responses,
  rich,
  writableTmpDirAsHomeHook,
}:

buildPythonPackage rec {
  pname = "censys";
  version = "2.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "censys";
    repo = "censys-python";
    tag = "v${version}";
    hash = "sha256-GBFsAVecUN49vousqnB6enqRsAg1aBrjaA/Q7XXnOUE=";
  };

  build-system = [ hatchling ];

  dependencies = [
    argcomplete
    backoff
    requests
    rich
  ];

  nativeCheckInputs = [
    parameterized
    pytest-mock
    pytest-cov-stub
    pytestCheckHook
    requests-mock
    responses
    writableTmpDirAsHomeHook
  ];

  # The tests want to write a configuration file
  preCheck = ''
    mkdir -p $HOME
  '';

  disabledTests = lib.optionals (pythonAtLeast "3.14") [
    # argparse usage prefix uses the actual prog (python3.14 -m pytest) instead of sys.argv[0]
    "test_default_help"
    "test_help"
    "test_search_help"
  ];

  pythonImportsCheck = [ "censys" ];

  meta = {
    description = "Python API wrapper for the Censys Search Engine (censys.io)";
    homepage = "https://github.com/censys/censys-python";
    license = lib.licenses.asl20;
    mainProgram = "censys";
  };
}
