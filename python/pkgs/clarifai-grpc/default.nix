{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  googleapis-common-protos,
  grpcio,
  protobuf,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "clarifai-grpc";
  version = "12.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Clarifai";
    repo = "clarifai-python-grpc";
    tag = finalAttrs.version;
    hash = "sha256-5onPljZp/ML/f+Ik2kYHj24COcvKcc/82W+B3xYiX1E=";
  };

  build-system = [ setuptools ];

  dependencies = [
    googleapis-common-protos
    grpcio
    protobuf
    requests
  ];

  pythonRelaxDeps = [
    "grpcio"
  ];

  # almost all tests require network access
  doCheck = false;

  pythonImportsCheck = [ "clarifai_grpc" ];

  meta = {
    description = "Clarifai gRPC API Client";
    homepage = "https://github.com/Clarifai/clarifai-python-grpc";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
