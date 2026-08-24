{ lib
, aiohttp
, buildPythonPackage
, fetchFromGitHub
, jsonrpc-base
, setuptools
,
}:

buildPythonPackage rec {
  pname = "jsonrpc-async";
  version = "2.1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "emlove";
    repo = "jsonrpc-async";
    tag = version;
    hash = "sha256-WcO2mj5QYZTMnFTNo1ABgpJPxM+GREVIf+z9viFDJHM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    jsonrpc-base
  ];

  pythonImportsCheck = [ "jsonrpc_async" ];

  meta = {
    description = "JSON-RPC client library for asyncio";
    homepage = "https://github.com/emlove/jsonrpc-async";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
