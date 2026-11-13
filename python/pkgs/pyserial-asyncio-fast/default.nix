{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pyserial,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyserial-asyncio-fast";
  version = "0.16";
  pyproject = true;

  src = fetchPypi {
    pname = "pyserial_asyncio_fast";
    inherit (finalAttrs) version;
    hash = "sha256-/VJkM4BAZznXdwFLCuoIc9dWtULrYvdVZWcjnOwAcRU=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyserial ];

  pythonImportsCheck = [ "serial_asyncio_fast" ];

  meta = {
    description = "Fast asyncio extension package for pyserial";
    homepage = "https://github.com/home-assistant-libs/pyserial-asyncio-fast";
    license = lib.licenses.bsd3;
  };
})
