{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  python-xlib,
}:

buildPythonPackage rec {
  pname = "i3ipc";
  version = "2.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6IDX1xR5WerVyzR2Twi5e0E4WzbrglborxzhY9vMzOg=";
  };

  build-system = [ setuptools ];

  dependencies = [ python-xlib ];

  doCheck = false;

  pythonImportsCheck = [ "i3ipc" ];

  meta = {
    description = "Improved Python library to control i3wm and sway";
    homepage = "https://github.com/altdesktop/i3ipc-python";
    license = lib.licenses.bsd3;
  };
}
