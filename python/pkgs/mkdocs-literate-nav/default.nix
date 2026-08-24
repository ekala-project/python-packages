{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  mkdocs,
}:

buildPythonPackage rec {
  pname = "mkdocs-literate-nav";
  version = "0.6.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "oprypin";
    repo = "mkdocs-literate-nav";
    tag = "v${version}";
    hash = "sha256-WP8VqiD/Kqswh1TWhSBsNfxn3gxKlRlg6RvGayAdQto=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    mkdocs
  ];

  pythonImportsCheck = [
    "mkdocs_literate_nav"
  ];

  meta = {
    description = "MkDocs plugin to specify the navigation in Markdown instead of YAML";
    homepage = "https://github.com/oprypin/mkdocs-literate-nav";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
