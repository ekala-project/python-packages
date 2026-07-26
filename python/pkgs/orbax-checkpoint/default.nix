{
  lib,
  absl-py,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # dependencies
  aiofiles,
  etils,
  humanize,
  jax,
  msgpack,
  numpy,
  prometheus-client,
  protobuf,
  psutil,
  pyyaml,
  simplejson,
  tensorstore,
  typing-extensions,
  uvloop,
}:

buildPythonPackage (finalAttrs: {
  pname = "orbax-checkpoint";
  version = "0.12.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "google";
    repo = "orbax";
    tag = "v${finalAttrs.version}";
    hash = "sha256-yE8M8f2c+4lTL56LrS57vU/MMM3NgYCZOuHZWbdODh0=";
  };

  sourceRoot = "${finalAttrs.src.name}/checkpoint";

  build-system = [ flit-core ];

  dependencies = [
    absl-py
    aiofiles
    etils
    humanize
    jax
    msgpack
    numpy
    prometheus-client
    protobuf
    psutil
    pyyaml
    simplejson
    tensorstore
    typing-extensions
    uvloop
  ]
  ++ etils.optional-dependencies.epath
  ++ etils.optional-dependencies.epy;

  pythonImportsCheck = [
    "orbax"
    "orbax.checkpoint"
  ];

  doCheck = false;

  meta = {
    description = "Orbax provides common utility libraries for JAX users";
    homepage = "https://github.com/google/orbax/tree/main/checkpoint";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
