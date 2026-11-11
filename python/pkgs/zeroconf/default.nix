{
  lib,
  fetchPypi,
  buildPythonPackage,
  cython,
  poetry-core,
  setuptools,
  ifaddr,
}:

buildPythonPackage (finalAttrs: {
  pname = "zeroconf";
  version = "0.154.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-gwMVSXr5u9dZJMIhjNO2TwveDoCO4xaqu12SiINsDEM=";
  };

  build-system = [
    cython
    poetry-core
    setuptools
  ];

  dependencies = [ ifaddr ];

  pythonImportsCheck = [ "zeroconf" ];

  meta = {
    description = "Python implementation of multicast DNS service discovery";
    homepage = "https://github.com/python-zeroconf/python-zeroconf";
    license = lib.licenses.lgpl21Only;
  };
})
