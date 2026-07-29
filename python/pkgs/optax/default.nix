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
}:

buildPythonPackage (finalAttrs: {
  pname = "optax";
  version = "0.2.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "deepmind";
    repo = "optax";
    tag = "v${finalAttrs.version}";
    hash = "sha256-dVmMacQx6V5lv0z4nWUTlekuEDqtIZlxJazAeA9UR+E=";
  };

  build-system = [ flit-core ];

  dependencies = [
    absl-py
    jax
    jaxlib
    numpy
  ];

  pythonImportsCheck = [ "optax" ];

  doCheck = false;

  meta = {
    description = "Gradient processing and optimization library for JAX";
    homepage = "https://github.com/deepmind/optax";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
