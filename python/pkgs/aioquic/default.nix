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

buildPythonPackage (finalAttrs: {
  pname = "aioquic";
  version = "1.7.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Te98sKaS3BLJlcw5epP0G3jMMLe/B4dpw6O7G6nc82I=";
  };

  build-system = [ setuptools ];

  buildInputs = [ openssl ];

  dependencies = [
    certifi
    cryptography
    # aioquic >= 1.5 requires pylsqpack >= 1.0; only consumer in this repo
    (pylsqpack.overridePythonAttrs (old: rec {
      version = "1.1.0";
      src = fetchPypi {
        pname = "pylsqpack";
        inherit version;
        hash = "sha256-CL8maJPcrtgX1yrBRQaglcl7MJ9orlemlGmdGGZgRQ4=";
      };
    }))
    pyopenssl
    service-identity
  ];

  pythonImportsCheck = [ "aioquic" ];

  meta = {
    description = "Implementation of QUIC and HTTP/3";
    homepage = "https://github.com/aiortc/aioquic";
    license = lib.licenses.bsd3;
  };
})
