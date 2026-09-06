{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatch-fancy-pypi-readme,
  hatchling,

  # dependencies
  anyio,
  distro,
  docstring-parser,
  httpx2,
  jiter,
  pydantic,
  sniffio,
  typing-extensions,

  # optional dependencies
  google-auth,
  boto3,
  botocore,
  aiohttp,
}:

buildPythonPackage (finalAttrs: {
  pname = "anthropic";
  version = "1.4.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "anthropics";
    repo = "anthropic-sdk-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-5iHawkW76aAwhjaGYCqN9Gl/PLKQqu8eNdRiTca4dvo=";
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
    distro
    docstring-parser
    httpx2
    jiter
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
    vertex = [ google-auth ] ++ google-auth.optional-dependencies.requests;
  };

  pythonImportsCheck = [ "anthropic" ];

  meta = {
    description = "Anthropic's safety-first language model APIs";
    homepage = "https://github.com/anthropics/anthropic-sdk-python";
    license = lib.licenses.mit;
  };
})
