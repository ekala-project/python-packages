{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "pykka";
  version = "4.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-gg/MNgRlUrSdfrYf6YCI0aKWMc8zFOjOS8Jqrq2NzU8=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "pykka" ];

  meta = {
    homepage = "https://www.pykka.org/";
    description = "Python implementation of the actor model";
    license = lib.licenses.asl20;
  };
})
