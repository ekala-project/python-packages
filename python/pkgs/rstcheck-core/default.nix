{
  lib,
  stdenv,
  buildPythonPackage,
  docutils,
  fetchFromGitHub,
  pydantic,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "rstcheck-core";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rstcheck";
    repo = "rstcheck-core";
    tag = "v${finalAttrs.version}";
    hash = "sha256-4NvaBG2LQqHJgDLcUpjVjknkc0unVyAM8d5Z8SlZ2jw=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  env.NIX_CFLAGS_COMPILE = lib.optionalString stdenv.cc.isClang "-Wno-strict-prototypes";

  dependencies = [
    docutils
    pydantic
  ];

  pythonImportsCheck = [ "rstcheck_core" ];

  meta = {
    description = "Library for checking syntax of reStructuredText";
    homepage = "https://github.com/rstcheck/rstcheck-core";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
