{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope-interface,
}:

buildPythonPackage rec {
  pname = "lazr-delegates";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "lazr_delegates";
    inherit version;
    hash = "sha256-uxXCGgG1d6tfrHPaYbFU3W/NN3868C5SIHe0rhH+7Tc=";
  };

  build-system = [ setuptools ];

  dependencies = [ zope-interface ];

  pythonNamespaces = [ "lazr" ];

  pythonImportsCheck = [ "lazr.delegates" ];

  meta = {
    description = "Easily write objects that delegate behavior";
    homepage = "https://launchpad.net/lazr.delegates";
    license = lib.licenses.lgpl3Only;
  };
}
