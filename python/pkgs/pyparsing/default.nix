{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyparsing";
  version = "3.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyparsing";
    repo = "pyparsing";
    tag = finalAttrs.version;
    hash = "sha256-ewohx7nMsO8GHwzd8feEoRm3hmjx6nupScBfjki8sp0=";
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
})
