{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-periphery";
  version = "2.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YdRh1zaYKm92boeHIKsQpoFR4ujBCGYA2TiaxH5A6Io=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "periphery" ];

  meta = {
    homepage = "https://github.com/vsergeev/python-periphery";
    description = "Linux Peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) with Python 2 & 3";
    license = lib.licenses.mit;
  };
}
