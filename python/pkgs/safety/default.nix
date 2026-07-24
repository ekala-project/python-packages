{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  click,
  packaging,
  dparse,
  ruamel-yaml,
  jinja2,
  marshmallow,
  nltk,
  authlib,
  typer,
  pydantic,
  safety-schemas,
  typing-extensions,
  filelock,
  httpx,
  tenacity,
  tomlkit,
  truststore,
}:

buildPythonPackage (finalAttrs: {
  pname = "safety";
  version = "3.8.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyupio";
    repo = "safety";
    tag = finalAttrs.version;
    hash = "sha256-xKZ8uhwuM6eu1NTppPFTBkxSjrguTw9GuIvPhPaTIAI=";
  };

  patches = [
    ./disable-telemetry.patch
  ];

  build-system = [ hatchling ];

  pythonRelaxDeps = [
    "safety-schemas"
  ];

  dependencies = [
    click
    packaging
    dparse
    ruamel-yaml
    jinja2
    marshmallow
    nltk
    authlib
    typer
    pydantic
    safety-schemas
    typing-extensions
    filelock
    httpx
    tenacity
    tomlkit
    truststore
  ];
  meta = {
    description = "Checks installed dependencies for known vulnerabilities";
    mainProgram = "safety";
    homepage = "https://github.com/pyupio/safety";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
