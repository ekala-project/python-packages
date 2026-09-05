{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "asteval";
  version = "1.0.10";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-RqTtE8wuSimiFBj4ne3VfbcNmOuW2w+0xEHU7bL1r+0=";
  };

  build-system = [ setuptools-scm ];

  pythonImportsCheck = [ "asteval" ];

  meta = {
    description = "AST evaluator of Python expression using ast module";
    homepage = "https://github.com/lmfit/asteval";
    license = lib.licenses.mit;
  };
}
