{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyqrcode";
  version = "1.2.1";
  pyproject = true;

  src = fetchPypi {
    pname = "PyQRCode";
    inherit version;
    hash = "sha256-/b92NHM+VrcuJ/m85G5FULdaOixCBBQDXK6dnSayNNU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyqrcode" ];

  meta = {
    description = "QR code generator written purely in Python with SVG, EPS, PNG and terminal output";
    homepage = "https://github.com/mnooner256/pyqrcode";
    license = lib.licenses.bsd3;
  };
}
