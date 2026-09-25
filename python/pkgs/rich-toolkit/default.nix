{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  click,
  rich,
  typing-extensions,

  # tests
  inline-snapshot,
  pydantic,
}:

buildPythonPackage (finalAttrs: {
  pname = "rich-toolkit";
  version = "0.20.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "patrick91";
    repo = "rich-toolkit";
    tag = finalAttrs.version;
    hash = "sha256-LiFzz2omvXuc0alR6lz29kNsKPhHzhv69SYy0tX2ytY=";
  };

  postPatch = ''
    # the commit updating the version happens only after tagging
    sed -i 's/version = ".*"/version = "${finalAttrs.version}"/' pyproject.toml
  '';

  build-system = [ hatchling ];

  dependencies = [
    click
    rich
    typing-extensions
  ];
  pythonImportsCheck = [ "rich_toolkit" ];

  meta = {
    description = "Rich toolkit for building command-line applications";
    homepage = "https://github.com/patrick91/rich-toolkit/";
    license = lib.licenses.mit;
  };
})
