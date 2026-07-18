{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "jsonrpclib-pelix";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "jsonrpclib_pelix";
    inherit version;
    hash = "sha256-Wx6hTabjcdur7bGr7QqLoc9ZZCg1DNnQGI88bGyO94Q=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "jsonrpclib" ];

  meta = {
    homepage = "https://pypi.org/project/jsonrpclib-pelix/";
    description = "JSON RPC client library - Pelix compatible fork";
    license = lib.licenses.asl20;
  };
}
