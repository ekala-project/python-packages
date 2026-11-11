{
  lib,
  buildPythonPackage,
  fetchPypi,
  isPyPy,
  # build-systems
  setuptools,
  # dependencies
  cffi,
  zope-deferredimport,
  zope-interface,
}:

buildPythonPackage (finalAttrs: {
  pname = "persistent";
  version = "6.9";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-hXJ8PWOP+IMIeKv4Fqz6qMKIo7Nyq3e6SCNn66lw4rI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    zope-interface
    zope-deferredimport
  ]
  ++ lib.optionals (!isPyPy) [ cffi ];

  pythonImportsCheck = [ "persistent" ];

  meta = {
    description = "Automatic persistence for Python objects";
    homepage = "https://github.com/zopefoundation/persistent/";
    license = lib.licenses.zpl21;
  };
})
