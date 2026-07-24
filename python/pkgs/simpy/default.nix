{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "simpy";
  version = "4.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-du82tx4ENrqU5V/rwAHHiHnkk6Mj8EW7z7sLIW6bH7w=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "simpy" ];

  meta = {
    description = "Process-based discrete-event simulation framework based on standard Python";
    homepage = "https://simpy.readthedocs.io/";
    license = lib.licenses.mit;
  };
}
