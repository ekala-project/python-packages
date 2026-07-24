{
  lib,
  fetchPypi,
  buildPythonPackage,
  cython,
  poetry-core,
  setuptools,
  ifaddr,
}:

buildPythonPackage rec {
  pname = "zeroconf";
  version = "0.150.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-pf5/6rHebvXlQeCj0H5TT9kWKbgT/CcoFZNYQQD2MWQ=";
  };

  build-system = [
    cython
    poetry-core
    setuptools
  ];

  dependencies = [ ifaddr ];

  doCheck = false;

  pythonImportsCheck = [ "zeroconf" ];

  meta = {
    description = "Python implementation of multicast DNS service discovery";
    homepage = "https://github.com/python-zeroconf/python-zeroconf";
    license = lib.licenses.lgpl21Only;
  };
}
