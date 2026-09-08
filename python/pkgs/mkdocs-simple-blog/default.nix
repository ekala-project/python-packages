{
  lib,
  buildPythonPackage,
  babel,
  fetchFromGitHub,
  mkdocs,
  poetry-core,
  pytestCheckHook,
  pytest-cov-stub,
}:
buildPythonPackage rec {
  pname = "mkdocs-simple-blog";
  version = "0.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "FernandoCelmer";
    repo = "mkdocs-simple-blog";
    tag = "v${version}";
    hash = "sha256-B+vTDwyhP80bCWNn58sUl+411NKUERWpQGESvj8NEEE=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    babel
    mkdocs
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-cov-stub
  ];

  pythonImportsCheck = [ "mkdocs_simple_blog" ];

  meta = {
    description = "Simple blog generator plugin for MkDocs";
    homepage = "https://fernandocelmer.github.io/mkdocs-simple-blog/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
