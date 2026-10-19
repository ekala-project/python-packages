{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyrss2gen";
  version = "1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "PyRSS2Gen";
    inherit (finalAttrs) version;
    hash = "sha256-eWCu1+mY0kgr9YcWwxZQl4b1lkJvh5sF+NhOmLgsbuc=";
  };

  build-system = [ setuptools ];

  # No tests in archive

  meta = {
    description = "Library for generating RSS 2.0 feeds";
    homepage = "http://www.dalkescientific.com/Python/PyRSS2Gen.html";
    license = lib.licenses.bsd2;
  };
})
