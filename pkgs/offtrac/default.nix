{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "offtrac";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ptC9aW5nxqsTUEuLKeSfJDv3cQRD2SCdp+cHdUEAbRs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "offtrac" ];

  meta = {
    description = "Trac xmlrpc library";
    homepage = "http://fedorahosted.org/offtrac";
    license = lib.licenses.gpl2;
  };
}
