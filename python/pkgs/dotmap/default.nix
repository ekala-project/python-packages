{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "dotmap";
  version = "1.3.30";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-WCGnkz8HX7R1Y0F8DpLgt8AxFYtMmmp+VhY0ebZYs2g=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dotmap" ];

  meta = {
    description = "Python for dot-access dictionaries";
    homepage = "https://github.com/drgrib/dotmap";
    license = lib.licenses.mit;
  };
}
