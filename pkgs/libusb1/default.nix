{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "libusb1";
  version = "3.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-OVHTYPLa8ODqz4OeFdLR0vT154MCMesxiO7/7y3Re60=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "usb1" ];

  meta = {
    homepage = "https://github.com/vpelletier/python-libusb1";
    description = "Python ctype-based wrapper around libusb1";
    license = lib.licenses.lgpl2Plus;
  };
}
