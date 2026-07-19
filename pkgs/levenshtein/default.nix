{
  lib,
  buildPythonPackage,
  fetchPypi,
  cmake,
  cython,
  ninja,
  scikit-build-core,
  rapidfuzz-cpp,
  rapidfuzz,
}:

buildPythonPackage rec {
  pname = "levenshtein";
  version = "0.27.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GsMmsshCFXlRY9ilr0cRiJGLh5e0lT7IequiLJwfn8A=";
  };

  dontUseCmakeConfigure = true;

  build-system = [
    cmake
    cython
    ninja
    scikit-build-core
  ];

  buildInputs = [ rapidfuzz-cpp ];

  dependencies = [ rapidfuzz ];

  pythonImportsCheck = [ "Levenshtein" ];

  meta = {
    description = "Functions for fast computation of Levenshtein distance and string similarity";
    homepage = "https://github.com/rapidfuzz/Levenshtein";
    license = lib.licenses.gpl2Plus;
  };
}
