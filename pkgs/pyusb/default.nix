{
  lib,
  stdenv,
  fetchPypi,
  buildPythonPackage,
  pkgs,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "pyusb";
  version = "1.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-OvBwtgdGfBwWT0nVsMqr6Kx42+2SmNcDqNv530BS0X4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  postPatch = ''
    libusb=${pkgs.libusb1.out}/lib/libusb-1.0${stdenv.hostPlatform.extensions.sharedLibrary}
    test -f $libusb || { echo "ERROR: $libusb doesn't exist, please update/fix this build expression."; exit 1; }
    sed -i -e "s|find_library=None|find_library=lambda _:\"$libusb\"|" usb/backend/libusb1.py
  '';

  pythonImportsCheck = [ "usb" ];

  meta = {
    description = "Python USB access module (wraps libusb 1.0)";
    homepage = "https://pyusb.github.io/pyusb/";
    license = lib.licenses.bsd3;
  };
}
