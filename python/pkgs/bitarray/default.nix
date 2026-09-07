{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "bitarray";
  version = "3.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vxlDfsAOw9QK74Lq7twUz0AAvptjXE9QSXllBuZjDdg=";
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
