{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  regex,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "lark";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lark-parser";
    repo = "lark";
    tag = version;
    hash = "sha256-JDtLSbVjypaHqamkknHDSql1GTMf1LA4TgJXqTn4Q20=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ regex ];

  pythonImportsCheck = [
    "lark"
    "lark.parsers"
    "lark.tools"
    "lark.grammars"
  ];

  doCheck = false;

  meta = {
    description = "Modern parsing library for Python, implementing Earley & LALR(1) and an easy interface";
    homepage = "https://lark-parser.readthedocs.io/";
    license = lib.licenses.mit;
  };
}
