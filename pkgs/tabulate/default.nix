{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools-scm,
  setuptools,
  wcwidth,
}:

buildPythonPackage (finalAttrs: {
  version = "0.10.0";
  pname = "tabulate";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "astanin";
    repo = "python-tabulate";
    tag = "v${finalAttrs.version}";
    hash = "sha256-JnwkABtIgPqANuv3lo8e8zr8m6a/qnxz4w1QvTVZFxg=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  optional-dependencies = {
    widechars = [ wcwidth ];
  };

  meta = {
    description = "Pretty-print tabular data";
    mainProgram = "tabulate";
    homepage = "https://github.com/astanin/python-tabulate";
    license = lib.licenses.mit;
  };
})
