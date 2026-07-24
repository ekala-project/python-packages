{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  termcolor,
  packaging,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-sugar";
  version = "1.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-c7i2UWPr8Q+fZx76ue7T1W8g0spovag/pkdAqSwI9l0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    termcolor
    packaging
  ];

  buildInputs = [ pytest ];

  pythonImportsCheck = [ "pytest_sugar" ];

  meta = {
    description = "Plugin that changes the default look and feel of pytest";
    homepage = "https://github.com/Teemu/pytest-sugar";
    license = lib.licenses.bsd3;
  };
}
