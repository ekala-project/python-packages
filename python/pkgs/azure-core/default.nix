{
  lib,
  buildPythonPackage,
  fetchPypi,
  aiohttp,
  opentelemetry-api,
  requests,
  setuptools,
  six,
  typing-extensions,
}:

buildPythonPackage rec {
  version = "1.41.0";
  pname = "azure-core";
  pyproject = true;

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    pname = "azure_core";
    inherit version;
    hash = "sha256-9G/1380jDyXPHBnoo0uNwIozeyUD4mi7YAoWwA24rVo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    six
    typing-extensions
  ];

  optional-dependencies = {
    aio = [ aiohttp ];
    tracing = [ opentelemetry-api ];
  };

  pythonImportsCheck = [ "azure.core" ];

  meta = {
    description = "Microsoft Azure Core Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/core/azure-core";
    license = lib.licenses.mit;
  };
}
