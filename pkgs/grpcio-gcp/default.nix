{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  grpcio,
}:

buildPythonPackage rec {
  pname = "grpcio-gcp";
  version = "0.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4pJgXv/H2jm3qHNMcZr7EuxLU2Kt01KNivrTqjqpBXw=";
  };

  build-system = [ setuptools ];

  dependencies = [ grpcio ];

  env.PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION = "python";

  pythonImportsCheck = [ "grpc_gcp" ];

  meta = {
    description = "gRPC extensions for Google Cloud Platform";
    homepage = "https://grpc.io";
    license = lib.licenses.asl20;
  };
}
