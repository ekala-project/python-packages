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
    tag = "v${version}";
    hash = "sha256-R6u2HDDLsli/omrtEKSRTH8Pd99gBI4iM+O0cZhoSJc=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [ ordered-set ];

  pythonImportsCheck = [
    "pylatex"
    "pylatex.base_classes"
  ];

  meta = {
    description = "Python library for creating LaTeX files and snippets";
    homepage = "https://jeltef.github.io/PyLaTeX/current/";
    downloadPage = "https://github.com/JelteF/PyLaTeX/releases";
    license = lib.licenses.mit;
  };
}
