{
  lib,
  buildPythonPackage,
  fetchPypi,
  openssl,
  setuptools,
  certifi,
  cryptography,
  pylsqpack,
  pyopenssl,
  service-identity,
}:

buildPythonPackage rec {
  pname = "aioquic";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-KNBwshg+PnmvqdTnvVWJYNDVOuuYvAzwo1iyebp5fJI=";
  };

  build-system = [ setuptools ];

  buildInputs = [ openssl ];

  dependencies = [
    certifi
    cryptography
    pylsqpack
    pyopenssl
    service-identity
  ];

  pythonImportsCheck = [ "aioquic" ];

  meta = {
    description = "Implementation of QUIC and HTTP/3";
    homepage = "https://github.com/aiortc/aioquic";
    license = lib.licenses.bsd3;
  };
}
