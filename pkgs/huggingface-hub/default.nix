{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  filelock,
  hf-xet,
  fsspec,
  httpx,
  packaging,
  pyyaml,
  tqdm,
  typer,
  typing-extensions,

  # optional-dependencies
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
