{
  lib,
  buildPythonPackage,
  fetchPypi,
  cmake,
  cython,
  ninja,
  scikit-build-core,
  rapidfuzz,
}:

buildPythonPackage (finalAttrs: {
  pname = "levenshtein";
  version = "0.27.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-IgIcr1hnpG+uWrknu9y0MFmdfl7jiYRJy75DD/B7fQg=";
  };

  dontUseCmakeConfigure = true;

  build-system = [
    cmake
    cython
    ninja
    scikit-build-core
  ];

  dependencies = [ rapidfuzz ];

  pythonImportsCheck = [ "Levenshtein" ];

  meta = {
    description = "Functions for fast computation of Levenshtein distance and string similarity";
    homepage = "https://github.com/rapidfuzz/Levenshtein";
    license = lib.licenses.gpl2Plus;
  };
})
