{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  pdm-backend,

  # dependencies
  annotated-doc,
  starlette,
  pydantic,
  typing-extensions,

  # optional-dependencies
  httpx,
  jinja2,
  itsdangerous,
  python-multipart,
  pyyaml,
  ujson,
  orjson,
  email-validator,
  uvicorn,
  pydantic-settings,
  pydantic-extra-types,
}:

buildPythonPackage rec {
  pname = "fastapi";
  version = "0.141.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tiangolo";
    repo = "fastapi";
    tag = version;
    hash = "sha256-5P9aDMS7gLti2CBlrucvjgl4Od1mti9ityPdqxI1RIM=";
  };

  build-system = [ pdm-backend ];

  pythonRelaxDeps = [
    "anyio"
    "starlette"
  ];

  dependencies = [
    annotated-doc
    starlette
    pydantic
    typing-extensions
  ];

  optional-dependencies = {
    all = [
      httpx
      jinja2
      python-multipart
      itsdangerous
      pyyaml
      ujson
      orjson
      email-validator
      uvicorn
    ]
    ++ lib.optionals (lib.versionAtLeast pydantic.version "2") [
      pydantic-settings
      pydantic-extra-types
    ]
    ++ uvicorn.optional-dependencies.standard;
    standard = [
      httpx
      jinja2
      python-multipart
      email-validator
      uvicorn
    ]
    ++ uvicorn.optional-dependencies.standard;
  };

  pythonImportsCheck = [ "fastapi" ];

  meta = {
    description = "Web framework for building APIs";
    homepage = "https://github.com/fastapi/fastapi";
    license = lib.licenses.mit;
  };
}
