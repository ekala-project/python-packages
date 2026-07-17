{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "rcssmin";
  version = "1.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-gGmG6vdBRUXtwoodKVI+lWDknhUf9KM32dHwJx1uHMQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "rcssmin" ];

  meta = {
    homepage = "http://opensource.perlig.de/rcssmin/";
    description = "CSS minifier written in pure python";
    license = lib.licenses.asl20;
  };
}
