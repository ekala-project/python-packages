{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  markdown,
  pyyaml,
  pygments,
}:

let
  extensions = [
    "arithmatex"
    "b64"
    "betterem"
    "caret"
    "critic"
    "details"
    "emoji"
    "escapeall"
    "extra"
    "highlight"
    "inlinehilite"
    "keys"
    "magiclink"
    "mark"
    "pathconverter"
    "progressbar"
    "saneheaders"
    "smartsymbols"
    "snippets"
    "striphtml"
    "superfences"
    "tabbed"
    "tasklist"
    "tilde"
  ];
in
buildPythonPackage rec {
  pname = "pymdown-extensions";
  version = "10.21.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "facelessuser";
    repo = "pymdown-extensions";
    tag = version;
    hash = "sha256-hu9fXjZxlris3AhPS7bz3kcSyQtSeh0B6ZAZBsCO4+g=";
  };

  build-system = [ hatchling ];

  dependencies = [
    markdown
    pygments
    pyyaml
  ];
  pythonImportsCheck = map (ext: "pymdownx.${ext}") extensions;
  meta = {
    description = "Extensions for Python Markdown";
    homepage = "https://facelessuser.github.io/pymdown-extensions/";
    license = with lib.licenses; [
      mit
      bsd2
    ];
    maintainers = [ ];
  };
}
