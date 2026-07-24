{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "adafruit-platformdetect";
  version = "3.89.1";
  pyproject = true;

  src = fetchPypi {
    pname = "adafruit_platformdetect";
    inherit version;
    hash = "sha256-dFUtGvz3eahMpjUnoerumZXEKf9CLbFUkrrQw1mcq0s=";
  };

  build-system = [ setuptools-scm ];

  # Project has not published tests yet
  doCheck = false;

  pythonImportsCheck = [ "adafruit_platformdetect" ];

  meta = {
    description = "Platform detection for use by Adafruit libraries";
    homepage = "https://github.com/adafruit/Adafruit_Python_PlatformDetect";
    license = lib.licenses.mit;
  };
}
