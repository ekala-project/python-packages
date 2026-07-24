{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  flit-core,
}:

buildPythonPackage rec {
  pname = "pyparsing";
  version = "3.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyparsing";
    repo = "pyparsing";
    tag = version;
    hash = "sha256-TlYl57JdMJzpCUkHMLiQuCb24UXoNFFTShfqcgrmZm8=";
  };

  nativeBuildInputs = [ flit-core ];

  pythonImportsCheck = [ "pyparsing" ];

  meta = {
    homepage = "https://github.com/pyparsing/pyparsing";
    description = "Python library for creating PEG parsers";
    longDescription = ''
      The pyparsing module is an alternative approach to creating and executing
      simple grammars, vs. the traditional lex/yacc approach, or the use of
      regular expressions. The pyparsing module provides a library of classes
      that client code uses to construct the grammar directly in Python code.
    '';
    license = lib.licenses.mit;
  };
}
