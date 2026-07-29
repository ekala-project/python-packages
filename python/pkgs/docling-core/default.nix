{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  setuptools,
  defusedxml,
  jsonref,
  jsonschema,
  latex2mathml,
  pandas,
  pillow,
  pydantic,
  pyyaml,
  semchunk,
  tabulate,
  transformers,
  tree-sitter,
  typer,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "docling-core";
  version = "2.73.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "docling-project";
    repo = "docling-core";
    tag = "v${finalAttrs.version}";
    hash = "sha256-aK+XHZjKsmFPgRv0oDed1CdBwZags/zcALumgcfQjjY=";
  };

  build-system = [
    poetry-core
    setuptools
  ];

  pythonRelaxDeps = [
    "defusedxml"
    "pillow"
    "typer"
  ];

  dependencies = [
    defusedxml
    jsonref
    jsonschema
    latex2mathml
    pandas
    pillow
    pydantic
    pyyaml
    semchunk
    tabulate
    transformers
    tree-sitter
    typer
    typing-extensions
  ];

  pythonImportsCheck = [ "docling_core" ];

  doCheck = false;

  meta = {
    description = "Python library to define and validate data types in Docling";
    homepage = "https://github.com/docling-project/docling-core";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
