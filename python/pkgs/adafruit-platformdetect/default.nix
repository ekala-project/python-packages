{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "adafruit-platformdetect";
  version = "3.90.0";
  pyproject = true;

  src = fetchPypi {
    pname = "adafruit_platformdetect";
    inherit (finalAttrs) version;
    hash = "sha256-QzFI6vFZZwAcZEowhD9UKBNDjCi8D/6JG36ZrUrqty0=";
  };

  build-system = [ setuptools-scm ];

  # Project has not published tests yet

  pythonImportsCheck = [ "adafruit_platformdetect" ];

  meta = {
    description = "Platform detection for use by Adafruit libraries";
    homepage = "https://github.com/adafruit/Adafruit_Python_PlatformDetect";
    license = lib.licenses.mit;
  };
})
