{
  lib,
  buildPythonPackage,
  click,
  dateutils,
  fetchFromGitHub,
  hatchling,
  hypothesis,
  importlib-metadata,
  jinja2,
  jsonschema,
  more-itertools,
  pydantic,
  pythonAtLeast,
  pyyaml,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "dbt-semantic-interfaces";
  version = "0.10.5";
  pyproject = true;

  # This project uses pydantic.v1 which doesn't support Python 3.14 or later:
  # https://pydantic.dev/articles/pydantic-v2-12-release#support-for-python-314
  disabled = pythonAtLeast "3.14";

  src = fetchFromGitHub {
    owner = "dbt-labs";
    repo = "dbt-semantic-interfaces";
    tag = "v${finalAttrs.version}";
    hash = "sha256-LA5GvSm8M15NOG6f2f/gXplqburO+SpAzMZr178jx9k=";
  };

  pythonRelaxDeps = [ "importlib-metadata" ];

  build-system = [
    hatchling
  ];

  dependencies = [
    click
    dateutils
    importlib-metadata
    jinja2
    jsonschema
    more-itertools
    pydantic
    pyyaml
    typing-extensions
  ];
  pythonImportsCheck = [ "dbt_semantic_interfaces" ];

  meta = {
    description = "Shared interfaces used by dbt-core and MetricFlow projects";
    homepage = "https://github.com/dbt-labs/dbt-semantic-interfaces";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
