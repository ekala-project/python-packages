{
  lib,
  buildPythonPackage,
  cython,
  fetchPypi,
  # build-system
  setuptools,
  java,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyjnius";
  version = "1.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-A4URhIyKTGqFuHiCdLfuxLLHjs1WUc0FuOqGSkLCLWQ=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [
    java
    cython
  ];

  pythonImportsCheck = [ "jnius" ];

  meta = {
    description = "Python module to access Java classes as Python classes using the Java Native Interface (JNI)";
    homepage = "https://github.com/kivy/pyjnius";
    license = lib.licenses.mit;
  };
})
