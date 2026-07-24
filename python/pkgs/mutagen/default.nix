{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mutagen";
  version = "1.48.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-j5Vjern28wXOxr0SlOGX3r4geZjj4GhZZWPHT4awoXM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mutagen" ];

  meta = {
    description = "Python module for handling audio metadata";
    homepage = "https://mutagen.readthedocs.io";
    license = lib.licenses.gpl2Plus;
  };
}
