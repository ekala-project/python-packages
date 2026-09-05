{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools-scm,
  # dependencies
  fastcrc,
  msgspec,
  numpy,
}:

buildPythonPackage (finalAttrs: {
  pname = "apycula";
  version = "0.33";
  pyproject = true;

  # The Pypi archive contains necessary files generated with proprietary tools.
  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-njVvWr8sH2UABEDxvTSDXBuTgaZNIHfphwiHB14IbhY=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    fastcrc
    msgspec
    numpy
  ];

  pythonImportsCheck = [ "apycula" ];

  meta = {
    description = "Open Source tools for Gowin FPGAs";
    homepage = "https://github.com/YosysHQ/apicula";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
