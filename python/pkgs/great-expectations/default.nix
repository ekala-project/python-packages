{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
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
  version = "1.11.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "great-expectations";
    repo = "great_expectations";
    tag = finalAttrs.version;
    hash = "sha256-8yKuEVupqbwlBGeUDu25pvGltybljkmpbkcbC+G+/VI=";
  };

  build-system = [ setuptools ];

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
    maintainers = [ ];
  };
})
