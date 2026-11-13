{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "setuptools-gettext";
  version = "0.1.20";
  pyproject = true;

  src = fetchPypi {
    pname = "setuptools_gettext";
    inherit (finalAttrs) version;
    hash = "sha256-yC03SIWbg/ndMB7X9WTFgRmAumrB71yyhctS2TXsSFY=";
  };

  build-system = [ setuptools ];

  dependencies = [ setuptools ];

  pythonImportsCheck = [ "setuptools_gettext" ];

  meta = {
    description = "Setuptools plugin for building mo files";
    homepage = "https://github.com/breezy-team/setuptools-gettext";
    license = lib.licenses.gpl2Plus;
  };
})
