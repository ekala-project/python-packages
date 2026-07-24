{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "ipaddr";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QJLf5mdYjRaqErWay3yKQCTl3LI6aBzQsLYCNz7KiNY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "ipaddr" ];

  meta = {
    description = "IP address manipulation library";
    homepage = "https://github.com/google/ipaddr-py";
    license = lib.licenses.asl20;
  };
}
