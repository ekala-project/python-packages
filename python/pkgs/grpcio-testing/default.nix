{
  lib,
  buildPythonPackage,
  fetchPypi,
  grpcio,
  protobuf,
  setuptools,
}:

# This package should be updated together with the main grpc package and other
# related python grpc packages.
# nixpkgs-update: no auto update
buildPythonPackage (finalAttrs: {
  pname = "grpcio-testing";
  version = "1.85.1";
  pyproject = true;

  src = fetchPypi {
    pname = "grpcio_testing";
    inherit (finalAttrs) version;
    hash = "sha256-ebWi9Udie3FOZHcI4h7NF0h0AEnGGi7OyPceVKDftWY=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail '"grpcio>={version}".format(version=grpc_version.VERSION)' '"grpcio"'
  '';

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  dependencies = [
    grpcio
    protobuf
  ];

  pythonImportsCheck = [ "grpc_testing" ];

  # Module has no tests

  meta = {
    description = "Testing utilities for gRPC Python";
    homepage = "https://grpc.io/";
    license = lib.licenses.asl20;
  };
})
