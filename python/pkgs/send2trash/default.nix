{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "send2trash";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hsoft";
    repo = "send2trash";
    tag = version;
    hash = "sha256-dBILb1tz3/X3/MnhSKujVX9pMFrTAyntQ+GQsscklQU=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "send2trash" ];

  meta = {
    description = "Send file to trash natively under macOS, Windows and Linux";
    mainProgram = "send2trash";
    homepage = "https://github.com/hsoft/send2trash";
    license = lib.licenses.bsd3;
  };
}
