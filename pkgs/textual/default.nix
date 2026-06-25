{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,

  # dependencies
  markdown-it-py,
  platformdirs,
  rich,
  typing-extensions,
  mdit-py-plugins,

  # dependencies
  linkify-it-py,

  # optional-dependencies
  tree-sitter,
}:

buildPythonPackage (finalAttrs: {
  pname = "textual";
  version = "8.2.7";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "Textualize";
    repo = "textual";
    tag = "v${finalAttrs.version}";
    hash = "sha256-jRTdxVpeRk8gAur5+VpLVVghBdYenXysoEFRBfczkR4=";
  };

  build-system = [ poetry-core ];

  pythonRelaxDeps = [
    "rich"
  ];
  dependencies = [
    linkify-it-py
    markdown-it-py
    mdit-py-plugins
    platformdirs
    rich
    typing-extensions
  ];

  optional-dependencies = {
    syntax = [
      tree-sitter
    ];
  };

  pythonImportsCheck = [ "textual" ];

  meta = {
    description = "TUI framework for Python inspired by modern web development";
    homepage = "https://github.com/Textualize/textual";
    license = lib.licenses.mit;
  };
})
