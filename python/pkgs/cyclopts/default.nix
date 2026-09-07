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
  version = "4.25.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "BrianPugh";
    repo = "cyclopts";
    tag = "v${finalAttrs.version}";
    hash = "sha256-SdI2xoPyLf3g+9zhGVyZIzGFwbezMku5l3h7SqeR79k=";
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
