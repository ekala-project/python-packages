{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  importlib-metadata,
  pydantic,
}:

buildPythonPackage (finalAttrs: {
  pname = "pydantic-compat";
  version = "0.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyapp-kit";
    repo = "pydantic-compat";
    tag = "v${finalAttrs.version}";
    hash = "sha256-MnfEbE+5jknX15F34l3LTYk9I+y2/sKIt846VzJ6ayo=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  env.SETUPTOOLS_SCM_PRETEND_VERSION = finalAttrs.version;

  dependencies = [
    importlib-metadata
    pydantic
  ];

  pythonImportsCheck = [ "pydantic_compat" ];

  meta = {
    description = "Compatibility layer for pydantic v1/v2";
    homepage = "https://github.com/pyapp-kit/pydantic-compat";
    license = lib.licenses.bsd3;
  };
})
