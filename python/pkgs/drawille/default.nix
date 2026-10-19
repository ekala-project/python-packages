{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "drawille";
  version = "0.2.0";

  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-gVND4RYsWAUtTLZS75cPZ3Ht2QBC1UnsxuRTyXNqoa0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "drawille" ];

  meta = {
    description = "Drawing in terminal with unicode braille characters";
    homepage = "https://github.com/asciimoo/drawille";
    license = lib.licenses.agpl3Plus;
    platforms = lib.platforms.all;
  };
})
