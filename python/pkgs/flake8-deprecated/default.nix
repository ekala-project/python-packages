{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  hatchling,
  flake8,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "flake8-deprecated";
  version = "2.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gforcada";
    repo = "flake8-deprecated";
    tag = finalAttrs.version;
    hash = "sha256-Gshd+pYnEHlSRx2/XymoGwEMljIFn05MAKpM3n1dUnQ=";
  };

  build-system = [ hatchling ];

  dependencies = [ flake8 ];

  nativeCheckInputs = [ pytestCheckHook ];

  enabledTestPaths = [ "run_tests.py" ];

  pythonImportsCheck = [ "flake8_deprecated" ];

  meta = {
    description = "Flake8 plugin that warns about deprecated method calls";
    homepage = "https://github.com/gforcada/flake8-deprecated";
    license = lib.licenses.gpl2Only;
  };
})
