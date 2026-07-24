{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  idna,
}:

buildPythonPackage rec {
  pname = "rfc3986";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-l6rPnb1L/YKbqtbmMJ+mVzqvG+P2+nNcirBeRs7LJhw=";
  };

  build-system = [ setuptools ];

  dependencies = [ idna ];

  doCheck = false;

  pythonImportsCheck = [ "rfc3986" ];

  meta = {
    description = "Validating URI References per RFC 3986";
    homepage = "https://rfc3986.readthedocs.org";
    license = lib.licenses.asl20;
  };
}
