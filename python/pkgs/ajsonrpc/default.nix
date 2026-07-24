{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ajsonrpc";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-eRusGPC/De4QkZRkTxUc+Lf/UpxLjWI5rEgQSjJRoZ8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "ajsonrpc" ];

  meta = {
    description = "Async JSON-RPC 2.0 protocol and asyncio server";
    homepage = "https://github.com/pavlov99/ajsonrpc";
    license = lib.licenses.mit;
  };
}
