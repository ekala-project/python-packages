{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "entrypoint2";
  version = "1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/At/57IazatHpYWrlAfKflxPlstoiFddtrDOuR8OEFo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "entrypoint2" ];

  meta = {
    description = "Easy to use command-line interface for python modules";
    homepage = "https://github.com/ponty/entrypoint2/";
    license = lib.licenses.bsd2;
  };
}
