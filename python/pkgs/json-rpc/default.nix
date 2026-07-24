{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "json-rpc";
  version = "1.15.0";
  pyproject = true;

  src = fetchPypi {
    pname = "json-rpc";
    inherit version;
    hash = "sha256-5kQdVsHc1UJByTfQotzRk73wvcU5tTFlJHE/VUt/hbk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "jsonrpc" ];

  meta = {
    description = "JSON-RPC 1/2 transport implementation";
    homepage = "https://github.com/pavlov99/json-rpc";
    license = lib.licenses.mit;
  };
}
