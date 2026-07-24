{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "bashlex";
  version = "0.18";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-W7A6AcbVZ2M4w2/RAoAJyK0H59Ydihzj9RO3//Unlu4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "bashlex" ];

  meta = {
    description = "Python parser for bash";
    homepage = "https://github.com/idank/bashlex";
    license = lib.licenses.gpl3Plus;
  };
}
