{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "setuptools-gettext";
  version = "0.1.18";
  pyproject = true;

  src = fetchPypi {
    pname = "setuptools_gettext";
    inherit version;
    hash = "sha256-ySsK5Ibe9QJobNlE8WVZgZ5C+NwLnWg89i50FTl/KzU=";
  };

  build-system = [ setuptools ];

  dependencies = [ setuptools ];

  pythonImportsCheck = [ "setuptools_gettext" ];

  meta = {
    description = "Setuptools plugin for building mo files";
    homepage = "https://github.com/breezy-team/setuptools-gettext";
    license = lib.licenses.gpl2Plus;
  };
}
