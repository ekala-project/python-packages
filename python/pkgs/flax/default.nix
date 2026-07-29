{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  flaxlib,
  jax,
  msgpack,
  numpy,
  optax,
  orbax-checkpoint,
  pyyaml,
  rich,
  tensorstore,
  treescope,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "flax";
  version = "0.12.7";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "google";
    repo = "flax";
    tag = "v${finalAttrs.version}";
    hash = "sha256-a78KiTsCCARWZvbxz9QKdUKnjkDJGXcPVVJu5rU4m/U=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    flaxlib
    jax
    msgpack
    numpy
    optax
    orbax-checkpoint
    pyyaml
    rich
    tensorstore
    treescope
    typing-extensions
  ];

  pythonImportsCheck = [ "flax" ];

  doCheck = false;

  meta = {
    description = "Neural network library for JAX";
    homepage = "https://github.com/google/flax";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
