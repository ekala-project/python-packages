{
  lib,
  aiohttp,
  aiosqlite,
  banks,
  buildPythonPackage,
  dataclasses-json,
  deprecated,
  dirtyjson,
  fetchFromGitHub,
  filetype,
  fsspec,
  hatchling,
  jsonpath-ng,
  llama-index-workflows,
  nest-asyncio,
  networkx,
  nltk,
  numpy,
  openai,
  pandas,
  pillow,
  pkgs,
  pyvis,
  pyyaml,
  requests,
  spacy,
  sqlalchemy,
  tenacity,
  tinytag,
  tiktoken,
  typing-inspect,
}:

buildPythonPackage (finalAttrs: {
  pname = "llama-index-core";
  version = "0.14.23";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "run-llama";
    repo = "llama_index";
    tag = "v${finalAttrs.version}";
    hash = "sha256-JH8J8lnW3QNMWUV5MD4zWoc9zaXfvGRxVXtI47sPg2o=";
  };

  sourceRoot = "${finalAttrs.src.name}/${finalAttrs.pname}";

  postPatch = ''
    mkdir -p llama_index/core/_static/nltk_cache/corpora/stopwords/
    cp -r ${pkgs.nltk-data.stopwords}/corpora/stopwords/* llama_index/core/_static/nltk_cache/corpora/stopwords/

    mkdir -p llama_index/core/_static/nltk_cache/tokenizers/punkt/
    cp -r ${pkgs.nltk-data.punkt}/tokenizers/punkt/* llama_index/core/_static/nltk_cache/tokenizers/punkt/
  '';

  pythonRelaxDeps = [
    "setuptools"
    "tenacity"
  ];

  build-system = [ hatchling ];

  dependencies = [
    aiohttp
    aiosqlite
    banks
    dataclasses-json
    deprecated
    dirtyjson
    filetype
    fsspec
    jsonpath-ng
    llama-index-workflows
    nest-asyncio
    networkx
    nltk
    numpy
    openai
    pandas
    pillow
    pyvis
    pyyaml
    requests
    spacy
    sqlalchemy
    tenacity
    tinytag
    tiktoken
    typing-inspect
  ];

  pythonImportsCheck = [ "llama_index" ];

  doCheck = false;

  meta = {
    description = "Data framework for your LLM applications";
    homepage = "https://github.com/run-llama/llama_index/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
