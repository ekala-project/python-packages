{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  mkdocs,
  wcmatch,
  platformdirs,
}:

buildPythonPackage (finalAttrs: {
  pname = "mkdocs-include-markdown-plugin";
  version = "7.3.1";
  pyproject = true;

  src = fetchPypi {
    pname = "mkdocs_include_markdown_plugin";
    inherit (finalAttrs) version;
    hash = "sha256-1h8NUANRcbpFJKw2z1UilXfntiv7LSOgudszl/WdP3E=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    mkdocs
    wcmatch
  ];

  optional-dependencies = {
    cache = [
      platformdirs
    ];
  };

  pythonImportsCheck = [
    "mkdocs_include_markdown_plugin"
  ];

  meta = {
    description = "Mkdocs Markdown includer plugin";
    homepage = "https://pypi.org/project/mkdocs-include-markdown-plugin/";
    license = lib.licenses.asl20;
  };
})
