{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pygtrie";
  version = "2.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GTRhMSYHC07FGjzvzwyUzrsBOQQ7REwPAkhsrr0NgBE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pygtrie" ];

  meta = {
    description = "Trie data structure implementation";
    homepage = "https://github.com/mina86/pygtrie";
    license = lib.licenses.asl20;
  };
}
