{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  cryptography,
  pyopenssl,
}:

buildPythonPackage rec {
  pname = "josepy";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-dMAzFRM3yFT4Pv5TBaKRaGzvcjtLlwxDz+cnDPSmd6k=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    cryptography
    pyopenssl
  ];

  pythonImportsCheck = [ "josepy" ];

  meta = {
    homepage = "https://github.com/certbot/josepy";
    description = "JOSE protocol implementation in Python";
    license = lib.licenses.asl20;
  };
}
