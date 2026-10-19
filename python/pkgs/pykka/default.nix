{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "pykka";
  version = "4.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VPz7ntXvkuuYv5lhz977xz3fvyQGDjGdUP3m7GbQDYo=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "pykka" ];

  meta = {
    homepage = "https://www.pykka.org/";
    description = "Python implementation of the actor model";
    license = lib.licenses.asl20;
  };
})
