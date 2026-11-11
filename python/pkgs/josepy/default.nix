{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  cryptography,
  pyopenssl,
}:

buildPythonPackage (finalAttrs: {
  pname = "josepy";
  version = "2.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ZAhKF4RcuMDBir48Zut01h5EwZyb1F0hzSeXSaesEJo=";
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
})
