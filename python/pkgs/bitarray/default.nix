{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "bitarray";
  version = "3.9.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-eW8rTw5NhN9QvSPd+ss3107sKyNmgTy48Yva5rJePTY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "bitarray" ];

  meta = {
    description = "Efficient arrays of booleans";
    homepage = "https://github.com/ilanschnell/bitarray";
    changelog = "https://github.com/ilanschnell/bitarray/raw/${version}/CHANGE_LOG";
    license = lib.licenses.psfl;
  };
}
