{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,

  # propagates
  packaging,
}:

buildPythonPackage (finalAttrs: {
  pname = "qtpy";
  version = "2.4.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-23RPeDLm09qQVoumzLyj7is7SokMPW+7xjFC9uTN9bs=";
  };

  build-system = [ setuptools ];

  dependencies = [ packaging ];

  meta = {
    description = "Abstraction layer for PyQt5/PyQt6/PySide2/PySide6";
    mainProgram = "qtpy";
    homepage = "https://github.com/spyder-ide/qtpy";
    license = lib.licenses.mit;
  };
})
