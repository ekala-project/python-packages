{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pysocks,
  requests,
  stem,
}:

buildPythonPackage rec {
  pname = "torrequest";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-N0XU6j/9qY16A0Njx4ets3qrd72rQAlKTZNzks1NroI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pysocks
    requests
    stem
  ];

  pythonImportsCheck = [ "torrequest" ];

  meta = {
    description = "Simple Python interface for HTTP(s) requests over Tor";
    homepage = "https://github.com/erdiaker/torrequest";
    license = lib.licenses.mit;
  };
}
