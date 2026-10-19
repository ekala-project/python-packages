{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  beautifulsoup4,
  jsbeautifier,
  mkdocs,
  mkdocs-material,
  pymdown-extensions,
  pyyaml,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "mkdocs-mermaid2-plugin";
  version = "1.2.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fralau";
    repo = "mkdocs-mermaid2-plugin";
    tag = "v${finalAttrs.version}";
    hash = "sha256-EsfcOnfjZpAndYccN8WTpfLoUAlc5JQkgoy1ro1hMRo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    beautifulsoup4
    jsbeautifier
    mkdocs
    mkdocs-material
    pymdown-extensions
    pyyaml
    requests
  ];

  # non-traditional python tests (e.g. nodejs based tests)

  pythonImportsCheck = [ "mermaid2" ];

  meta = {
    description = "MkDocs plugin for including mermaid graphs in markdown sources";
    homepage = "https://github.com/fralau/mkdocs-mermaid2-plugin";
    license = lib.licenses.mit;
  };
})
