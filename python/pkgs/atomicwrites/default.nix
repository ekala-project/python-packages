{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "atomicwrites";
  version = "1.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-gbLJBxpJNnp/dwFw5e7Iy2ZWfPu8jHPSDOXKSo1xzxE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "atomicwrites" ];

  meta = {
    description = "Atomic file writes on POSIX";
    homepage = "https://pypi.org/project/atomicwrites/";
    license = lib.licenses.mit;
  };
})
