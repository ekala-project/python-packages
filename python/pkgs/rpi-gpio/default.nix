{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rpi-gpio";
  version = "0.7.1";
  pyproject = true;

  src = fetchPypi {
    pname = "RPi.GPIO";
    inherit (finalAttrs) version;
    hash = "sha256-zWHEsDw3tiu6SlrP6phidJwzxhjgKV5+kKpHE/s3O3A=";
  };

  build-system = [ setuptools ];

  # Raspberry Pi

  meta = {
    homepage = "https://sourceforge.net/p/raspberry-gpio-python";
    description = "Python module to control the GPIO on a Raspberry Pi";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
})
