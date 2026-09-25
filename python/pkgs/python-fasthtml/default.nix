{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  beautifulsoup4,
  fastcore,
  fastlite,
  httpx2,
  itsdangerous,
  oauthlib,
  python-dateutil,
  python-multipart,
  starlette,
  uvicorn,
  # optional-dependencies
  ipython,
  lxml,
  monsterui ? null,
  # TODO: package
  pyjwt,
  pysymbol-llm ? null, # TODO: package
}:

buildPythonPackage (finalAttrs: {
  pname = "python-fasthtml";
  version = "0.14.13";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AnswerDotAI";
    repo = "fasthtml";
    tag = finalAttrs.version;
    hash = "sha256-MqxBS+SjQS8A5L/4WV0mk+PdF76At7nmxDbIzluHkLU=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    beautifulsoup4
    fastcore
    fastlite
    httpx2
    itsdangerous
    oauthlib
    python-dateutil
    python-multipart
    starlette
    uvicorn
  ];

  optional-dependencies = {
    dev = [
      ipython
      lxml
      monsterui
      pyjwt
      pysymbol-llm
    ];
  };

  pythonImportsCheck = [
    "fasthtml"
  ];

  meta = {
    description = "The fastest way to create an HTML app";
    homepage = "https://github.com/AnswerDotAI/fasthtml";
    license = lib.licenses.asl20;
  };
})
