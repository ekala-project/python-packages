{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "crc";
  version = "8.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Nicoretti";
    repo = "crc";
    tag = version;
    hash = "sha256-yEjYME2WhYdPcdbGplBaXXfppPTpNwz6jQm5CIJrrzY=";
  };

  build-system = [ hatchling ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "crc" ];

  disabledTestPaths = [ "test/bench" ];

  meta = {
    description = "Python module for calculating and verifying predefined & custom CRC's";
    homepage = "https://nicoretti.github.io/crc/";
    license = lib.licenses.bsd2;
    mainProgram = "crc";
  };
}
