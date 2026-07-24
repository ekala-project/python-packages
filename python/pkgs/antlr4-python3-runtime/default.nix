{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "antlr4-python3-runtime";
  version = "4.13.2";
  pyproject = true;

  src = fetchPypi {
    pname = "antlr4_python3_runtime";
    inherit version;
    hash = "sha256-kJtkfh0vwrcBgKxYbfOTPjiRnIX5jMxlapbNPyXvORY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "antlr4" ];

  meta = {
    description = "Runtime for ANTLR";
    mainProgram = "pygrun";
    homepage = "https://www.antlr.org/";
    license = lib.licenses.bsd3;
  };
}
