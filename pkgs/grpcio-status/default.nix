{
  lib,
  buildPythonPackage,
  fetchPypi,
  googleapis-common-protos,
  grpcio,
  protobuf,
}:

buildPythonPackage rec {
  pname = "grpcio-status";
  version = "1.80.0";
  format = "setuptools";

  src = fetchPypi {
    pname = "grpcio_status";
    inherit version;
    hash = "sha256-33OAKkyJo+qIqir/lx6Ib8zOFivC5lEUCLPWehRDgc0=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace 'protobuf>=4.21.6' 'protobuf'
  '';

  propagatedBuildInputs = [
    googleapis-common-protos
    grpcio
    protobuf
  ];

  # Project has no tests
  doCheck = false;

  pythonImportsCheck = [ "grpc_status" ];

  meta = {
    description = "GRPC Python status proto mapping";
    homepage = "https://github.com/grpc/grpc/tree/master/src/python/grpcio_status";
    license = lib.licenses.asl20;
  };
}
