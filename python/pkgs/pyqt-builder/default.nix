{
  lib,
  buildPythonPackage,
  fetchPypi,
  packaging,
  setuptools,
  setuptools-scm,
  sip,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyqt-builder";
  version = "1.21.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pyqt_builder";
    inherit (finalAttrs) version;
    hash = "sha256-Zz76JyN6gf/vx9mmQZVlYAoSm09M9NNYyJo0izmzpFQ=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    packaging
    sip
  ];

  pythonImportsCheck = [ "pyqtbuild" ];

  # There aren't tests

  meta = {
    description = "PEP 517 compliant build system for PyQt";
    homepage = "https://github.com/Python-PyQt/PyQt-builder";
    license = lib.licenses.gpl3Only;
  };
})
