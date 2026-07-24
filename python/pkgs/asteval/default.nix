{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "asteval";
  version = "1.0.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-T3Mj1j2fv4nX4dX4u1m2wJOXDBW7WSbm5n0BlYWKojA=";
  };

  build-system = [ setuptools-scm ];

  pythonImportsCheck = [ "asteval" ];

  meta = {
    description = "AST evaluator of Python expression using ast module";
    homepage = "https://github.com/lmfit/asteval";
    license = lib.licenses.mit;
  };
}
