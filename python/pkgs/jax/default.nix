{
  lib,
  stdenv,
  blas,
  lapack,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  jaxlib,
  ml-dtypes,
  numpy,
  opt-einsum,
  scipy,
}:

let
  usingMKL = blas.implementation == "mkl" || lapack.implementation == "mkl";
in
buildPythonPackage (finalAttrs: {
  pname = "jax";
  version = "0.11.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "google";
    repo = "jax";
    tag = "jax-v${finalAttrs.version}";
    hash = "sha256-OiH4qhVK7T6o+lYtP1e2UqtSitxVdzUWC5YXbaNMZsQ=";
  };

  build-system = [ setuptools ];

  env.JAX_RELEASE = "1";

  pythonRelaxDeps = [ "jaxlib" ];

  dependencies = [
    jaxlib
    ml-dtypes
    numpy
    opt-einsum
    scipy
  ];

  pythonImportsCheck = [ "jax" ];

  meta = {
    description = "Source-built JAX frontend: differentiate, compile, and transform Numpy code";
    homepage = "https://github.com/google/jax";
    license = lib.licenses.asl20;
  };
})
