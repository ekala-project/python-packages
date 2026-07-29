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
buildPythonPackage {
  pname = "jax";
  version = "0.11.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "google";
    repo = "jax";
    tag = "jax-v0.11.0";
    hash = "sha256-EE4JuiiwgdQlTsX6dE8KRjcGZHRiQVDXlDVFHchfyYs=";
  };

  build-system = [ setuptools ];

  env.JAX_RELEASE = "1";

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
    maintainers = [ ];
  };
}
