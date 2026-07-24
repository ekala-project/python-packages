{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,

  # optional-dependencies
  numpy,
  huggingface-hub,
  setuptools-rust,
  pytest,
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
    testing = self.numpy ++ [
      huggingface-hub
      setuptools-rust
      pytest
      hypothesis
      fsspec
    ];
    all = self.numpy ++ self.testing;
    dev = self.all;
  });

  pythonImportsCheck = [ "safetensors" ];

  meta = {
    homepage = "https://github.com/huggingface/safetensors";
    description = "Fast (zero-copy) and safe (unlike pickle) format for storing tensors";
    license = lib.licenses.asl20;
  };
})
