{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "pykka";
  version = "4.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-VPz7ntXvkuuYv5lhz977xz3fvyQGDjGdUP3m7GbQDYo=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "pykka" ];

  doCheck = false;

  meta = {
    homepage = "https://www.pykka.org/";
    description = "Python implementation of the actor model";
    license = lib.licenses.asl20;
  };
}
