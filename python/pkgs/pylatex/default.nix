{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  ordered-set,
}:

buildPythonPackage rec {
  pname = "pylatex";
  version = "1.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "JelteF";
    repo = "PyLaTeX";
    rev = "v${version}";
    hash = "sha256-gZKMYGMp7bzDY5+Xx9h1AFP4l0Zd936fDfSXyW5lY1k=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ ordered-set ];

  pythonImportsCheck = [
    "pylatex"
    "pylatex.base_classes"
  ];

  meta = {
    description = "Python library for creating LaTeX files and snippets";
    homepage = "https://jeltef.github.io/PyLaTeX/current/";
    downloadPage = "https://github.com/JelteF/PyLaTeX/releases";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
