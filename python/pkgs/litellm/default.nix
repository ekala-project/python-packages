{
  lib,
  a2a-sdk,
  aiohttp,
  anthropic,
  apscheduler,
  azure-identity,
  azure-keyvault-secrets,
  azure-storage-blob,
  azure-storage-file-datalake,
  backoff,
  boto3,
  buildPythonPackage,
  click,
  cryptography,
  fastapi,
  fastuuid,
  fetchFromGitHub,
  google-cloud-iam,
  google-cloud-kms,
  google-genai,
  grpcio,
  gunicorn,
  httpx,
  importlib-metadata,
  jinja2,
  jsonschema,
  langfuse,
  mcp,
  openai,
  opentelemetry-api,
  opentelemetry-exporter-otlp,
  opentelemetry-sdk,
  orjson,
  polars,
  prometheus-client,
  pydantic,
  pyjwt,
  pynacl,
  pypdf,
  python-dotenv,
  python-multipart,
  pyyaml,
  resend,
  restrictedpython,
  rich,
  rq,
  sentry-sdk,
  soundfile,
  tiktoken,
  tokenizers,
  uv-build,
  uvicorn,
  uvloop,
  websockets,
}:

buildPythonPackage rec {
  pname = "litellm";
  version = "1.89.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "BerriAI";
    repo = "litellm";
    tag = "v${version}";
    hash = "sha256-tPw4cDqCQgyC8EoB5EPfui2gT+frjlSMOv95ntUXTWk=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "uv_build==0.11.8" "uv_build"
  '';

  build-system = [ uv-build ];

  dependencies = [
    aiohttp
    click
    fastuuid
    httpx
    importlib-metadata
    jinja2
    jsonschema
    openai
    pydantic
    python-dotenv
    tiktoken
    tokenizers
  ];

  optional-dependencies = {
    proxy = [
      apscheduler
      azure-identity
      azure-storage-blob
      backoff
      boto3
      cryptography
      fastapi
      gunicorn
      mcp
      orjson
      polars
      pyjwt
      pynacl
      python-multipart
      pyyaml
      restrictedpython
      rich
      rq
      soundfile
      uvloop
      uvicorn
      websockets
    ];

    extra_proxy = [
      a2a-sdk
      azure-identity
      azure-keyvault-secrets
      google-cloud-iam
      google-cloud-kms
      resend
    ];

    proxy-runtime = [
      anthropic
      azure-storage-file-datalake
      google-genai
      grpcio
      langfuse
      opentelemetry-api
      opentelemetry-exporter-otlp
      opentelemetry-sdk
      prometheus-client
      pypdf
      sentry-sdk
    ];
  };

  pythonImportsCheck = [ "litellm" ];

  pythonRelaxDeps = [
    "aiohttp"
    "click"
    "importlib-metadata"
    "jsonschema"
    "openai"
    "pydantic"
    "python-dotenv"
  ];

  doCheck = false;

  meta = {
    description = "Use any LLM as a drop in replacement for gpt-3.5-turbo";
    mainProgram = "litellm";
    homepage = "https://github.com/BerriAI/litellm";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
