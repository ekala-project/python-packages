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
  version = "0.151.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zmxUjmZXWbYVDO9Nuaude92JhX6QxROr1rc0C919vWo=";
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
