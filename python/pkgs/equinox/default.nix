{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  jax,
  jaxtyping,
  typing-extensions,
  wadler-lindig,
}:

buildPythonPackage (finalAttrs: {
  pname = "equinox";
  version = "0.13.8";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "patrick-kidger";
    repo = "equinox";
    tag = "v${finalAttrs.version}";
    hash = "sha256-JiIZKWuSkvrF09GdmegUeTyidaM5IRp4uqjJRsn86E4=";
  };

  build-system = [ hatchling ];

  dependencies = [
    jax
    jaxtyping
    typing-extensions
    wadler-lindig
  ];

  pythonImportsCheck = [ "equinox" ];

  doCheck = false;

  meta = {
    description = "JAX library based around a simple idea: represent parameterised functions as PyTrees";
    homepage = "https://github.com/patrick-kidger/equinox";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
