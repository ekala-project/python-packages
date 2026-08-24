{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  beautifulsoup4
, fastcore
, fastlite
, httpx
, itsdangerous
, oauthlib
, python-dateutil
, python-multipart
, starlette
, uvicorn
, # optional-dependencies
  ipython
, lxml
, monsterui ? null
, # TODO: package
  pyjwt
, pysymbol-llm ? null
, # TODO: package
}:

buildPythonPackage (finalAttrs: {
  pname = "python-fasthtml";
  version = "0.13.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AnswerDotAI";
    repo = "fasthtml";
    tag = finalAttrs.version;
    hash = "sha256-PS5HGegC6pG/bJAGrKDsRYguBnNS9EDrZIjWvjErO4M=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    beautifulsoup4
    fastcore
    fastlite
    httpx
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
    maintainers = [ ];
  };
})
