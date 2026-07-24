{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "jdcal";
  version = "1.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Ryhy4JbrjfIZwj8mifwzZmi9tD0ZQJS1zBcH4WQKz8g=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "jdcal" ];

  meta = {
    homepage = "https://github.com/phn/jdcal";
    description = "Module containing functions for converting between Julian dates and calendar dates";
    license = lib.licenses.bsd2;
  };
}
