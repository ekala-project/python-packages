{
  lib,
  fetchPypi,
  buildPythonPackage,
  cython,
  poetry-core,
  setuptools,
}:

buildPythonPackage rec {
  pname = "rencode";
  version = "1.0.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-g7LZtthK3DVhW3oJt0J5IRq6r1eleK8QrQEkVamadyI=";
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
}
