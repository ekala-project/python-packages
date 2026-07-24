{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  grpcio,
  protobuf,
}:

buildPythonPackage rec {
  pname = "grpc-interceptor";
  version = "0.15.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "d5h-foss";
    repo = "grpc-interceptor";
    tag = "v${version}";
    hash = "sha256-GJkVCslPXShJNDrqhFtCsAK5+VaG8qFJo0RQTsiMIFY=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    grpcio
    protobuf
  ];

  pythonImportsCheck = [ "grpc_interceptor" ];

  meta = {
    description = "Simplified gRPC interceptors";
    homepage = "https://github.com/d5h-foss/grpc-interceptor";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
