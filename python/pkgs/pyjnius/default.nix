{ lib
, buildPythonPackage
, cython
, fetchPypi
, jdk
,
}:

buildPythonPackage rec {
  pname = "pyjnius";
  version = "1.7.0";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-n4FwhISwqE6tPrC6hOU6xXnkxDyhDHRvmJip891Q9U0=";
  };

  nativeBuildInputs = [
    jdk
    cython
  ];

  pythonImportsCheck = [ "jnius" ];

  meta = {
    description = "Python module to access Java classes as Python classes using the Java Native Interface (JNI)";
    homepage = "https://github.com/kivy/pyjnius";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
