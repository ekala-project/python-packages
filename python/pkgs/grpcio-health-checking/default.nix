{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  grpcio,
  protobuf,
}:

buildPythonPackage (finalAttrs: {
  pname = "grpcio-health-checking";
  version = "1.85.1";
  pyproject = true;

  src = fetchPypi {
    pname = "grpcio_health_checking";
    inherit (finalAttrs) version;
    hash = "sha256-k6XuspJiFllJsy/aqGUF8RAY0bgWE4LuNzqFUwsR0oE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    grpcio
    protobuf
  ];

  pythonRelaxDeps = [ "grpcio" ];

  pythonImportsCheck = [ "grpc_health" ];

  # no tests

  meta = {
    description = "Standard Health Checking Service for gRPC";
    homepage = "https://pypi.org/project/grpcio-health-checking/";
    license = with lib.licenses; [ asl20 ];
  };
})
