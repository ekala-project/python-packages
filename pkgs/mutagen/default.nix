{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mutagen";
  version = "1.47.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cZ+t7wqXjDG0zzyVYmGzxYtpSLMgIweKIRex3gnw/Jk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mutagen" ];

  meta = {
    description = "Python module for handling audio metadata";
    homepage = "https://mutagen.readthedocs.io";
    license = lib.licenses.gpl2Plus;
  };
}
