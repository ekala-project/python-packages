{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,

  # dependencies
  numpy,
  pyyaml,
  requests,
  tqdm,
}:

buildPythonPackage (finalAttrs: {
  pname = "gguf";
  version = "9967";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ggml-org";
    repo = "llama.cpp";
    tag = "b${finalAttrs.version}";
    hash = "sha256-HgptebnnT3xOU26/UJCqQ6FSrhcoybju7SKUy4pLOKA=";
  };

  sourceRoot = "${finalAttrs.src.name}/gguf-py";

  build-system = [ poetry-core ];

  dependencies = [
    numpy
    pyyaml
    requests
    tqdm
  ];

  pythonImportsCheck = [ "gguf" ];

  meta = {
    description = "Module for writing binary files in the GGUF format";
    homepage = "https://ggml.ai/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
