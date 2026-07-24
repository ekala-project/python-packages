{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pygtrie";
  version = "2.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IDUUrYJutAPasdLi3dA04NFTS75NvgITuwWT9mvrpOI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pygtrie" ];

  meta = {
    description = "Trie data structure implementation";
    homepage = "https://github.com/mina86/pygtrie";
    license = lib.licenses.asl20;
  };
}
