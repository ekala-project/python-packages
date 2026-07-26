{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  filelock,
  huggingface-hub,
  importlib-metadata,
  numpy,
  pillow,
  regex,
  requests,
  safetensors,

  # optional dependencies
  flax,
  jax,
  jaxlib,
  jinja2,
  protobuf,
}:

buildPythonPackage rec {
  pname = "diffusers";
  version = "0.38.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "huggingface";
    repo = "diffusers";
    tag = "v${version}";
    hash = "sha256-FyXQJh4i/m9lAD2Sz45YWc+KIFMA+xQLb3ErudO9voY=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "safetensors"
  ];

  dependencies = [
    filelock
    huggingface-hub
    importlib-metadata
    numpy
    pillow
    regex
    requests
    safetensors
  ];

  optional-dependencies = {
    flax = [
      flax
      jax
      jaxlib
    ];
    training = [
      jinja2
      protobuf
    ];
  };

  pythonImportsCheck = [ "diffusers" ];

  doCheck = false;

  meta = {
    description = "State-of-the-art diffusion models for image and audio generation in PyTorch";
    mainProgram = "diffusers-cli";
    homepage = "https://github.com/huggingface/diffusers";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
