{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "latexcodec";
  version = "3.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-54ppEc1y+d7DUDHG7CNYTeaEK/vEYQqWeIaNFM37A1c=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "latexcodec" ];

  meta = {
    homepage = "https://github.com/mcmtroffaes/latexcodec";
    description = "Lexer and codec to work with LaTeX code in Python";
    license = lib.licenses.mit;
  };
}
