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
  version = "1.83.1";
  pyproject = true;

  src = fetchPypi {
    pname = "grpcio_health_checking";
    inherit (finalAttrs) version;
    hash = "sha256-1gkk5vutOPNcNyd5vF62UaAORG1tJPHRxy8UKXodDlY=";
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
