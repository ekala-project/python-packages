{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "types-psutil";
  version = "7.2.2.20261111";
  pyproject = true;

  src = fetchPypi {
    pname = "types_psutil";
    inherit (finalAttrs) version;
    hash = "sha256-1ncRnET7gMyb5B2KxzHwi/iZdLsdqkm2aIZlqdciT0I=";
  };

  build-system = [ setuptools ];

  # Module doesn't have tests

  pythonImportsCheck = [ "psutil-stubs" ];

  meta = {
    description = "Typing stubs for psutil";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
})
