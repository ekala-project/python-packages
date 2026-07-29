{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  huggingface-hub,
  numpy,
  packaging,
  pyyaml,
  regex,
  safetensors,
  tokenizers,
  tqdm,
  typer,
}:

buildPythonPackage (finalAttrs: {
  pname = "transformers";
  version = "5.5.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "huggingface";
    repo = "transformers";
    tag = "v${finalAttrs.version}";
    hash = "sha256-ZqynYPj8VxH6BmvxHuw3lq16e2FFi3p8pw5of+vkz40=";
  };

  build-system = [ setuptools ];

  dependencies = [
    huggingface-hub
    numpy
    packaging
    pyyaml
    regex
    safetensors
    tokenizers
    tqdm
    typer
  ];

  doCheck = false;

  pythonImportsCheck = [ "transformers" ];

  meta = {
    homepage = "https://github.com/huggingface/transformers";
    description = "Natural Language Processing for TensorFlow 2.0 and PyTorch";
    mainProgram = "transformers-cli";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
})
