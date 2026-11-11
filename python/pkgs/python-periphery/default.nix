{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-periphery";
  version = "2.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vsergeev";
    repo = "python-periphery";
    tag = "v${finalAttrs.version}";
    hash = "sha256-faVsDcrA24jb3Iyu72MYEOkoyRKPKA/IjovzDJRJksY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "periphery" ];

  meta = {
    homepage = "https://github.com/vsergeev/python-periphery";
    description = "Linux Peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) with Python 2 & 3";
    license = lib.licenses.mit;
  };
})
