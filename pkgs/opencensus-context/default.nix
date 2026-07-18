{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "opencensus-context";
  version = "0.1.3";
  pyproject = true;

  src = fetchPypi {
    pname = "opencensus-context";
    inherit version;
    hash = "sha256-oDEIw8ENjIC7Xd9cih8DMWH6YZcqmRf5ubOhhRfwCIw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "opencensus.common.runtime_context" ];

  pythonNamespaces = [ "opencensus.common" ];

  meta = {
    description = "OpenCensus Runtime Context";
    homepage = "https://github.com/census-instrumentation/opencensus-python/tree/master/context/opencensus-context";
    license = lib.licenses.asl20;
  };
}
