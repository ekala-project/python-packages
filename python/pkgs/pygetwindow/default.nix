{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pyrect,
}:
buildPythonPackage rec {
  pname = "pygetwindow";
  version = "0.0.9";
  pyproject = true;

  src = fetchPypi {
    pname = "PyGetWindow";
    inherit version;
    hash = "sha256-F4lDVefSswXNgy1xdwg4QBfBaYqQziT29/vwJC3Qpog=";
  };

  build-system = [ setuptools ];

  # This lib officially only works completely on Windows and partially on MacOS but pyautogui requires it
  # pythonImportsCheck = [ "pygetwindow" ];

  dependencies = [ pyrect ];

  meta = {
    description = "Simple, cross-platform module for obtaining GUI information on applications' windows";
    homepage = "https://github.com/asweigart/PyGetWindow";
    license = lib.licenses.bsd3;
  };
}
