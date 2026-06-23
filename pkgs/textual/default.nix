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

  # optional-dependencies
  tree-sitter,
  tree-sitter-c-sharp,
  tree-sitter-html,
  tree-sitter-javascript,
  tree-sitter-make,
  tree-sitter-markdown,
  tree-sitter-python,
  tree-sitter-rust,
  tree-sitter-sql,
  tree-sitter-yaml,
  tree-sitter-zeek,
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
    markdown-it-py
    mdit-py-plugins
    platformdirs
    rich
    typing-extensions
  ]
  ++ markdown-it-py.optional-dependencies.plugins
  ++ markdown-it-py.optional-dependencies.linkify;

  optional-dependencies = {
    syntax = [
      tree-sitter
      tree-sitter-c-sharp
      tree-sitter-html
      tree-sitter-javascript
      tree-sitter-make
      tree-sitter-markdown
      tree-sitter-python
      tree-sitter-rust
      tree-sitter-sql
      tree-sitter-yaml
      tree-sitter-zeek
    ];
  };

  pythonImportsCheck = [ "textual" ];

  meta = {
    description = "TUI framework for Python inspired by modern web development";
    homepage = "https://github.com/Textualize/textual";
    license = lib.licenses.mit;
  };
})
