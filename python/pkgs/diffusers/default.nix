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
  version = "0.40.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "huggingface";
    repo = "diffusers";
    tag = "v${version}";
    hash = "sha256-MwKzy8Zle1+jXu9SSDmU3qL1ScnLnrBZNKJ9gyIrYAo=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "huggingface-hub"
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
  };
}
