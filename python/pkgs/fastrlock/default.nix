{
  lib,
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "fastrlock";
  version = "0.8.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scoder";
    repo = "fastrlock";
    tag = "v${finalAttrs.version}";
    hash = "sha256-NB/AR6g1ZP5Atc0zwZNuXLsxg8BM67rWnx3Q6Pb0k5k=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ cython ];

  # Todo: Check why the tests have an import error

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "fastrlock" ];

  meta = {
    description = "RLock implementation for CPython";
    homepage = "https://github.com/scoder/fastrlock";
    license = lib.licenses.mit;
  };
})
