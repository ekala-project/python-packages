{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  versioneer,
  altair,
  cryptography,
  jinja2,
  jsonschema,
  marshmallow,
  mistune,
  numpy,
  packaging,
  pandas,
  posthog,
  pydantic,
  pyparsing,
  python-dateutil,
  requests,
  ruamel-yaml,
  scipy,
  tqdm,
  tzlocal,
}:

buildPythonPackage (finalAttrs: {
  pname = "great-expectations";
  version = "1.22.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "great-expectations";
    repo = "great_expectations";
    tag = finalAttrs.version;
    hash = "sha256-HTa6cr8Ij5AVvFFGDZxADtMWDEd6GTNp3T4m2XXyslY=";
  };

  build-system = [
    setuptools
    versioneer
  ];

  dependencies = [
    altair
    cryptography
    jinja2
    jsonschema
    marshmallow
    mistune
    numpy
    packaging
    pandas
    posthog
    pydantic
    pyparsing
    python-dateutil
    requests
    ruamel-yaml
    scipy
    tqdm
    tzlocal
  ];

  pythonRelaxDeps = [
    "altair"
    "pandas"
    "posthog"
  ];

  pythonImportsCheck = [ "great_expectations" ];

  doCheck = false;

  meta = {
    description = "Library for writing unit tests for data validation";
    homepage = "https://docs.greatexpectations.io";
    license = lib.licenses.asl20;
  };
})
