{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wsproto,
}:

buildPythonPackage rec {
  pname = "simple-websocket";
  version = "1.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "simple_websocket";
    inherit version;
    hash = "sha256-eTkjTnqgZ8U0q9qzqe2TPsnORpGwcTx4rLGVVgqlKuQ=";
  };

  build-system = [ setuptools ];

  dependencies = [ wsproto ];

  doCheck = false;

  pythonImportsCheck = [ "simple_websocket" ];

  meta = {
    description = "Simple WebSocket server and client for Python";
    homepage = "https://github.com/miguelgrinberg/simple-websocket";
    license = lib.licenses.mit;
  };
}
