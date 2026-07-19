{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  google-api-core,
  opencensus-context,
  six,
}:

buildPythonPackage rec {
  pname = "opencensus";
  version = "0.11.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-y++H2Lh3MGSrYOXCoc7Vi7qjim0FLEGuwiSVjOVE7/I=";
  };

  build-system = [ setuptools ];

  dependencies = [
    google-api-core
    opencensus-context
    six
  ];

  pythonNamespaces = [ "opencensus.common" ];

  pythonImportsCheck = [ "opencensus.common" ];

  meta = {
    description = "Stats collection and distributed tracing framework";
    homepage = "https://github.com/census-instrumentation/opencensus-python";
    license = lib.licenses.asl20;
  };
}
