{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  googleapis-common-protos,
  grpcio,
  protobuf,
}:

buildPythonPackage (finalAttrs: {
  pname = "grpcio-status";
  version = "1.83.1";
  pyproject = true;

  src = fetchPypi {
    pname = "grpcio_status";
    inherit (finalAttrs) version;
    hash = "sha256-wIyNVT1quW7/rh2SODneIpJvWjFqlC9IpIBA4EfFF68=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace 'protobuf>=4.21.6' 'protobuf'
  '';

  dependencies = [
    googleapis-common-protos
    grpcio
    protobuf
  ];

  # Project has no tests

  pythonImportsCheck = [ "grpc_status" ];

  meta = {
    description = "GRPC Python status proto mapping";
    homepage = "https://github.com/grpc/grpc/tree/master/src/python/grpcio_status";
    license = lib.licenses.asl20;
  };
})
