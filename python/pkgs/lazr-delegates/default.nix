{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope-interface,
}:

buildPythonPackage rec {
  pname = "lazr-delegates";
  version = "2.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "lazr_delegates";
    inherit version;
    hash = "sha256-rs6yYW5Rtz8yf78SxOwrfXZwy4IL1eT2hRIV+3lsAtw=";
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
