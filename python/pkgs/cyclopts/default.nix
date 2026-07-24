{
  lib,
  attrs,
  buildPythonPackage,
  docstring-parser,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  pyyaml,
  rich,
  rich-rst,
  trio,
}:

buildPythonPackage (finalAttrs: {
  pname = "cyclopts";
  version = "4.18.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "BrianPugh";
    repo = "cyclopts";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Gg1FrEXmx90U5vO6u0ttue+niswIuWrKYFpscAoaaKY=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    attrs
    docstring-parser
    rich
    rich-rst
  ];

  optional-dependencies = {
    trio = [ trio ];
    yaml = [ pyyaml ];
  };

  pythonImportsCheck = [ "cyclopts" ];

  meta = {
    description = "Module to create CLIs based on Python type hints";
    homepage = "https://github.com/BrianPugh/cyclopts";
    license = lib.licenses.asl20;
  };
})
