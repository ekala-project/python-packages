{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  runs,
  xmod,
}:

buildPythonPackage rec {
  pname = "editor";
  version = "1.6.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-u2mJ6HJjjNEZ25pPzihM2OE8VTiGocBExrjYoWDIcfg=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    runs
    xmod
  ];

  pythonImportsCheck = [ "editor" ];

  meta = {
    description = "Open the default text editor";
    homepage = "https://github.com/rec/editor";
    license = lib.licenses.mit;
  };
}
