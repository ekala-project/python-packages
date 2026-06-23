{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  markdown-it-py,
  pygments,
}:

buildPythonPackage rec {
  pname = "rich";
  version = "14.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Textualize";
    repo = "rich";
    tag = "v${version}";
    hash = "sha256-6udVO7N17ineQozlCG/tI9jJob811gqb4GtY50JZFb0=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    markdown-it-py
    pygments
  ];

  pythonImportsCheck = [ "rich" ];

  meta = {
    description = "Render rich text, tables, progress bars, syntax highlighting, markdown and more to the terminal";
    homepage = "https://github.com/Textualize/rich";
    license = lib.licenses.mit;
  };
}
