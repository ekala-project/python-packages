{
  lib,
  fetchPypi,
  buildPythonPackage,
  cython,
  poetry-core,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rencode";
  version = "1.0.9";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-yjr+jQnSb7SKwK1nc+NewK4bktA40hdoXFTFqGV34vI=";
  };

  build-system = [
    cython
    poetry-core
    setuptools
  ];

  pythonImportsCheck = [ "rencode" ];

  meta = {
    description = "Fast (basic) object serialization similar to bencode";
    homepage = "https://github.com/aresch/rencode";
    license = lib.licenses.gpl3Plus;
  };
})
