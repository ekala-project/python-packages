{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "socksipy-branch";
  version = "1.01";
  pyproject = true;

  src = fetchPypi {
    pname = "SocksiPy-branch";
    inherit version;
    hash = "sha256-F6lQYOKMO5A4qbjBhlxU+MHFvvFdVhv3d8m788gOhAY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "socks" ];

  meta = {
    description = "Python module for TCP connections through a SOCKS proxy";
    homepage = "http://code.google.com/p/socksipy-branch/";
    license = lib.licenses.bsd3;
  };
}
