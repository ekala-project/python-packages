{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  filelock,
  fsspec,
  hf-xet,
  httpx,
  packaging,
  pyyaml,
  tqdm,
  typer,
  typing-extensions,

  # optional-dependencies
  # torch
  torch,
  safetensors,
  # fastai
  toml,
  fastai,
  fastcore,
  # gradio
  gradio,
  requests,
  # mcp
  mcp,
}:

buildPythonPackage (finalAttrs: {
  pname = "huggingface-hub";
  version = "1.10.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "huggingface";
    repo = "huggingface_hub";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Q9N0QnxV8oJcxUsJzv4wX8Z6FkNdEfUH5BEVoZolsRY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    filelock
    fsspec
    hf-xet
    httpx
    packaging
    pyyaml
    tqdm
    typer
    typing-extensions
  ];

  optional-dependencies = {
    all = [

    ];
    torch = [
      torch
      safetensors
    ]
    ++ safetensors.optional-dependencies.torch;
    fastai = [
      toml
      fastai
      fastcore
    ];
    gradio = [
      gradio
      requests
    ];
    hf_xet = [
      hf-xet
    ];
    mcp = [
      mcp
    ];
  };

  pythonImportsCheck = [ "huggingface_hub" ];

  meta = {
    description = "Download and publish models and other files on the huggingface.co hub";
    mainProgram = "hf";
    homepage = "https://github.com/huggingface/huggingface_hub";
    license = lib.licenses.asl20;
  };
})
