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
  version = "0.149.16";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XmtaOxU8LMKo2eb28YnsVjj32chvw+iKbFPraGN2Gl4=";
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
