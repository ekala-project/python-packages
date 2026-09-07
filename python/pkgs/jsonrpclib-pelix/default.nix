{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "jsonrpclib-pelix";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "jsonrpclib_pelix";
    inherit version;
    hash = "sha256-NTtmcHwPxCY+3I/Wu9Rxt67egjqD5NvxYUsMg67iDxg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "jsonrpclib" ];

  meta = {
    homepage = "https://pypi.org/project/jsonrpclib-pelix/";
    description = "JSON RPC client library - Pelix compatible fork";
    license = lib.licenses.asl20;
  };
}
