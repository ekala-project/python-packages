{
  lib,
  buildPythonPackage,
  cachecontrol,
  feedparser,
  fetchFromGitHub,
  gitpython,
  jsonfeed,
  mkdocs,
  pytest-cov-stub,
  setuptools,
  setuptools-scm,
  validator-collection,
}:

buildPythonPackage (finalAttrs: {
  pname = "mkdocs-rss-plugin";
  version = "1.17.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Guts";
    repo = "mkdocs-rss-plugin";
    tag = finalAttrs.version;
    hash = "sha256-rUMjS0+895SsU7qNckLL3BprUQa/3lJDjpwhMkF0jYg=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    cachecontrol
    gitpython
    mkdocs
  ]
  ++ cachecontrol.optional-dependencies.filecache;
  pythonImportsCheck = [ "mkdocs_rss_plugin" ];
  meta = {
    description = "MkDocs plugin to generate a RSS feeds for created and updated pages, using git log and YAML frontmatter";
    homepage = "https://github.com/Guts/mkdocs-rss-plugin";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
