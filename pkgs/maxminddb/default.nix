{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "maxminddb";
  version = "3.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-l5KxliWUXf8Ubi4xh/nkcLgjMKkS986lWBuL1a8w2os=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  doCheck = false;

  pythonImportsCheck = [ "maxminddb" ];

  meta = {
    description = "Reader for the MaxMind DB format";
    homepage = "https://github.com/maxmind/MaxMind-DB-Reader-python";
    license = lib.licenses.asl20;
  };
}
