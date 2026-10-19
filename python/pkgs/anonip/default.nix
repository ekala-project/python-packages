{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
  pytest-cov-stub,
}:

buildPythonPackage rec {
  pname = "anonip";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "DigitaleGesellschaft";
    repo = "Anonip";
    tag = "v${version}";
    sha256 = "0cssdcridadjzichz1vv1ng7jwphqkn8ihh83hpz9mcjmxyb94qc";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-cov-stub
  ];

  enabledTestPaths = [ "tests.py" ];

  pythonImportsCheck = [ "anonip" ];

  meta = {
    description = "Tool to anonymize IP addresses in log files";
    mainProgram = "anonip";
    homepage = "https://github.com/DigitaleGesellschaft/Anonip";
    license = lib.licenses.bsd3;
  };
}
