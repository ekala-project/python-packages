{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "libusb1";
  version = "3.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nPVjhQbVTyG/NlUNl+pjGJERojxNgHj2MBA6IFITX0U=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "usb1" ];

  meta = {
    homepage = "https://github.com/vpelletier/python-libusb1";
    description = "Python ctype-based wrapper around libusb1";
    license = lib.licenses.lgpl2Plus;
  };
}
