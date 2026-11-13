{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "ipy";
  version = "1.2";
  pyproject = true;

  src = fetchPypi {
    pname = "ipy";
    inherit (finalAttrs) version;
    hash = "sha256-wUXmZOhGQvrIdaBD+rGgtQvWUpc4XcQ42/4l8k5lrGE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "IPy" ];

  meta = {
    homepage = "https://github.com/autocracy/python-ipy";
    description = "Class and tools for handling of IPv4 and IPv6 addresses and networks";
    license = lib.licenses.bsdOriginal;
  };
})
