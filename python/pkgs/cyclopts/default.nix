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
  version = "4.24.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "BrianPugh";
    repo = "cyclopts";
    tag = "v${finalAttrs.version}";
    hash = "sha256-2+UcktWF5/E+fcGRmxTz6ef3oT9vUixC5jLNn4QQFMM=";
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
