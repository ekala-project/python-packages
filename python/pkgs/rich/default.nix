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
  version = "15.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Textualize";
    repo = "rich";
    tag = "v${version}";
    hash = "sha256-Uk3r6aYhrjYJ8GrMKfdlv3/muK/uUynd4pd1yWCwSOM=";
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
