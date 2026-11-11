{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatch-fancy-pypi-readme,
  hatchling,

  # dependencies
  anyio,
  docstring-parser,
  httpx2,
  jiter,
  opentelemetry-api,
  pydantic,
  sniffio,
  typing-extensions,

  # optional dependencies
  google-auth,
  boto3,
  botocore,
  aiohttp,
  mcp,
  standardwebhooks,
}:

buildPythonPackage (finalAttrs: {
  pname = "anthropic";
  version = "2.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "anthropics";
    repo = "anthropic-sdk-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-oY39Butkm7hnMxxg7QwiA7fepGBI95mvTK2edXNjyWo=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"hatchling==1.26.3"' '"hatchling>=1.26.3"'
  '';

  build-system = [
    hatchling
    hatch-fancy-pypi-readme
  ];

  dependencies = [
    anyio
    docstring-parser
    httpx2
    jiter
    opentelemetry-api
    pydantic
    sniffio
    typing-extensions
  ];

  optional-dependencies = {
    aiohttp = [
      aiohttp
    ];
    bedrock = [
      boto3
      botocore
    ];
    aws = [
      boto3
      botocore
    ];
    vertex = [ google-auth ] ++ google-auth.optional-dependencies.requests;
    google_cloud = [ google-auth ] ++ google-auth.optional-dependencies.requests;
    mcp = [ mcp ];
    webhooks = [ standardwebhooks ];
  };

  pythonImportsCheck = [ "anthropic" ];

  meta = {
    description = "Anthropic's safety-first language model APIs";
    homepage = "https://github.com/anthropics/anthropic-sdk-python";
    license = lib.licenses.asl20;
  };
})
