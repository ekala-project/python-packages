{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "slicerator";
  version = "1.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-RAEKf1zYdoDAchO1yr6B0ftxJSlilD5Tc+59FGBdYEY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "slicerator" ];

  meta = {
    description = "Lazy-loading, fancy-sliceable iterable";
    homepage = "https://github.com/soft-matter/slicerator";
    license = lib.licenses.bsdOriginal;
  };
})
