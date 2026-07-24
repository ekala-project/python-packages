{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "jsonrpclib-pelix";
  version = "1.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "jsonrpclib_pelix";
    inherit version;
    hash = "sha256-N5o8mz3UeHJ0GVh6p88Uu2/w5kMB3swP+pj3EPa/7B4=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "jsonrpclib" ];

  meta = {
    homepage = "https://pypi.org/project/jsonrpclib-pelix/";
    description = "JSON RPC client library - Pelix compatible fork";
    license = lib.licenses.asl20;
  };
}
