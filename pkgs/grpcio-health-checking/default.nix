{
  lib,
  buildPythonPackage,
  fetchPypi,
  grpcio,
  protobuf,
}:

buildPythonPackage rec {
  pname = "grpcio-health-checking";
  version = "1.83.0";
  format = "setuptools";

  src = fetchPypi {
    pname = "grpcio_health_checking";
    inherit version;
    hash = "sha256-rWvE1aEQOtcE0lzNgt7zAN+ieZaxhcqz5Mzu7yxoZ9Q=";
  };

  propagatedBuildInputs = [
    grpcio
    protobuf
  ];

  pythonRelaxDeps = [ "grpcio" ];

  pythonImportsCheck = [ "grpc_health" ];

  # no tests
  doCheck = false;

  meta = {
    description = "Standard Health Checking Service for gRPC";
    homepage = "https://pypi.org/project/grpcio-health-checking/";
    license = with lib.licenses; [ asl20 ];
  };
}
