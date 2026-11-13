{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "adafruit-pureio";
  version = "1.1.12";
  pyproject = true;

  src = fetchPypi {
    pname = "adafruit_pureio";
    inherit (finalAttrs) version;
    hash = "sha256-HruEFlKP9xBXD7CtMh/tiF1QvsdIzM0pNen9azNsHQg=";
  };

  build-system = [ setuptools-scm ];

  # Physical SMBus is not present

  pythonImportsCheck = [ "Adafruit_PureIO" ];

  meta = {
    description = "Python interface to Linux IO including I2C and SPI";
    homepage = "https://github.com/adafruit/Adafruit_Python_PureIO";
    license = lib.licenses.mit;
  };
})
