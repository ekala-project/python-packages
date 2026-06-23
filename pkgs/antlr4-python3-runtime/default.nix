{
  lib,
  buildPythonPackage,
  setuptools,
  antlr4,
}:

buildPythonPackage rec {
  pname = "antlr4-python3-runtime";
  inherit (antlr4.runtime.cpp) version src;

  pyproject = true;

  sourceRoot = "${src.name}/runtime/Python3";

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace tests/TestIntervalSet.py \
      --replace "assertEquals" "assertEqual"
  '';

  pythonImportsCheck = [ "antlr4" ];

  meta = {
    description = "Runtime for ANTLR";
    mainProgram = "pygrun";
    homepage = "https://www.antlr.org/";
    license = lib.licenses.bsd3;
  };
}
