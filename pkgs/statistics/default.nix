{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  docutils,
}:

buildPythonPackage rec {
  pname = "statistics";
  version = "1.0.3.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LcN5uAsHvy3dVIjK0GsrlTHaTdMe2wTcnsDcImSGwTg=";
  };

  build-system = [ setuptools ];

  dependencies = [ docutils ];

  pythonImportsCheck = [ "statistics" ];

  meta = {
    description = "Python 2.* port of 3.4 Statistics Module";
    homepage = "https://github.com/digitalemagine/py-statistics";
    license = lib.licenses.asl20;
  };
}
