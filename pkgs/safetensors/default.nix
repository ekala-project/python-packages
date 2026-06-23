{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,

  # optional-dependencies
  numpy,
  packaging,
  torch,
  tensorflow,
  flax,
  jax,
  mlx,
  paddlepaddle,
  h5py,
  huggingface-hub,
  setuptools-rust,
  pytest,
  pytest-benchmark,
  hypothesis,
  fsspec,
}:

buildPythonPackage (finalAttrs: {
  pname = "safetensors";
  version = "0.8.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "huggingface";
    repo = "safetensors";
    tag = "v${finalAttrs.version}";
    hash = "sha256-jD12fRcQ9mPQVr3M1G5pP9rC3cPE5Eu9m9Ga5N9Tsqg=";
  };

  sourceRoot = "${finalAttrs.src.name}/bindings/python";

  cargoDeps = rustPlatform.importCargoLock { lockFile = ./Cargo.lock; };

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];

  optional-dependencies = lib.fix (self: {
    numpy = [ numpy ];
    torch = self.numpy ++ [
      packaging
      torch
    ];
    tensorflow = self.numpy ++ [
      tensorflow
    ];
    pinned-tf = self.numpy ++ [
      tensorflow
    ];
    jax = self.numpy ++ [
      flax
      jax
    ];
    mlx = [
      mlx
    ];
    paddlepaddle = self.numpy ++ [
      paddlepaddle
    ];
    testing = self.numpy ++ [
      h5py
      huggingface-hub
      setuptools-rust
      pytest
      pytest-benchmark
      hypothesis
      fsspec
    ];
    all = self.torch ++ self.numpy ++ self.pinned-tf ++ self.jax ++ self.paddlepaddle ++ self.testing;
    dev = self.all;
  });

  pythonImportsCheck = [ "safetensors" ];

  meta = {
    homepage = "https://github.com/huggingface/safetensors";
    description = "Fast (zero-copy) and safe (unlike pickle) format for storing tensors";
    license = lib.licenses.asl20;
  };
})
