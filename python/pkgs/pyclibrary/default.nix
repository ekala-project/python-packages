{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  setuptools-scm,
  pyparsing,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyclibrary";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "MatthieuDartiailh";
    repo = "pyclibrary";
    tag = finalAttrs.version;
    hash = "sha256-RyIbRySRWSZwKP5G6yXYCOnfKOV0165aPyjMf3nSbOM=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    pyparsing
  ];

  pythonImportsCheck = [ "pyclibrary" ];

  meta = {
    description = "C parser and ctypes automation for python";
    homepage = "https://github.com/MatthieuDartiailh/pyclibrary";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
