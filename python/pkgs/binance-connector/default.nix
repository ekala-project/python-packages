{
  lib,
  buildPythonPackage,
  fetchPypi,
  pycryptodome,
  requests,
  setuptools,
  websocket-client,
}:

buildPythonPackage (finalAttrs: {
  pname = "binance-connector";
  version = "3.12.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-M78DBS4vG+PO0RlqNsUac2pQqq4H95ImQMfrwBfGAR8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    pycryptodome
    websocket-client
  ];

  pythonImportsCheck = [
    "binance.spot"
    "binance.websocket"
  ];

  meta = {
    description = "Simple connector to Binance Public API";
    homepage = "https://github.com/binance/binance-connector-python";
    license = lib.licenses.mit;
  };
})
