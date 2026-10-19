{
  lib,
  fetchPypi,
  # build-system
  setuptools,
  buildPythonPackage,
  helpdev,
  qtpy,
}:

buildPythonPackage (finalAttrs: {
  pname = "qdarkstyle";
  version = "3.2.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "QDarkStyle";
    hash = "sha256-DAt/dKbpISEAiZKzabq2BGgVfbHALNMNZKXpo7QC8a4=";
  };

  build-system = [ setuptools ];

  # No tests available

  dependencies = [
    helpdev
    qtpy
  ];

  meta = {
    description = "Dark stylesheet for Python and Qt applications";
    homepage = "https://github.com/ColinDuquesnoy/QDarkStyleSheet";
    license = lib.licenses.mit;
  };
})
