{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # dependencies
  absl-py,
  jax,
  jaxlib,
  numpy,
  toolz,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "chex";
  version = "0.1.92";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "google-deepmind";
    repo = "chex";
    tag = "v${finalAttrs.version}";
    hash = "sha256-PM76Q72Bgyms7dROJkmlpPuDvtqjHLPTDkUYqo08T74=";
  };

  build-system = [ flit-core ];

  dependencies = [
    absl-py
    jax
    jaxlib
    numpy
    toolz
    typing-extensions
  ];

  pythonImportsCheck = [ "chex" ];

  meta = {
    description = "Library of utilities for helping to write reliable JAX code";
    homepage = "https://github.com/google-deepmind/chex";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
