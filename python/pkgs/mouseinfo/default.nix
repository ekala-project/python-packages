{
  lib,
  buildPythonPackage,
  pyperclip,
  fetchFromGitHub,
  # build-system
  setuptools,
  python-xlib,
  pillow,
}:
buildPythonPackage {
  pname = "mouseinfo";
  version = "0.1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "asweigart";
    repo = "mouseinfo";
    rev = "1876ad5cd311b4352d46bc64a12edfb4da49974e";
    hash = "sha256-UTaHTJE0xFihN9r+DY/WhekZ7S/CXtMFbqAayzexRxk=";
  };

  build-system = [ setuptools ];

  patches = [
    ./fix-xlib-version.patch
    ./pillow-version.patch
  ];

  # Mouseinfo requires a X server running to import successfully
  # pythonImportsCheck = [ "mouseinfo" ];

  dependencies = [
    pyperclip
    python-xlib
    pillow
  ];

  meta = {
    description = "Application to display XY position and RGB color information for the pixel currently under the mouse. Works on Python 2 and 3";
    homepage = "https://github.com/asweigart/mouseinfo";
    license = lib.licenses.gpl3;
  };
}
